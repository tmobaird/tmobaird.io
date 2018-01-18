# frozen_string_literal: true

RSpec.describe 'Posts' do
  let(:admin) { FactoryGirl.create :admin }

  describe 'View Posts' do
    it 'displays posts' do
      post_one = FactoryGirl.create(:post, title: 'New Post 1', admin: admin)
      post_two = FactoryGirl.create(:post, title: 'New Post 2', admin: admin)
      visit posts_path
      expect(page).to have_selector('.post', text: 'New Post 1')
      expect(page).to have_selector('.post', text: 'New Post 2')
    end
    context 'when a user is not signed in' do
      it 'does not show unpublished posts' do
        post = FactoryGirl.create(:post, title: 'Unpublished Post', body: 'Test Post Body', published: false)
        visit posts_path
        expect(page).not_to have_selector('.post', text: 'Unpublished Post')
      end
    end
  end
  context 'Auth Required' do
    before { sign_in admin }
    describe 'View Post' do
      it 'displays post' do
        post_one = FactoryGirl.create(:post, title: 'New Post 1', body: 'Test Post Body')
        visit post_path(post_one)
        expect(page).to have_selector('h1', text: 'New Post 1')
        expect(page).to have_selector('.post-body-full', text: 'Test Post Body')
        expect(page).to have_selector('small', text: "by #{post_one.admin.full_name}")
        expect(page).to have_link('Edit')
        expect(page).to have_link('Back')
      end
      it 'does not show unpublished posts' do
        post = FactoryGirl.create(:post, title: 'Unpublished Post', body: 'Test Post Body', published: false)
        visit posts_path
        element = find('.post', text: 'Unpublished Post')
        expect(element).to have_selector('.badge', text: 'Draft')
      end
    end
    describe 'Create Post' do
      before do
        visit new_post_path
        fill_in 'post[title]', with: 'My New Post'
        fill_in 'post[body]', with: 'My New Posts Body'
      end
      it 'creates and displays a new post', js: true do
        click_button 'Create Post'
        expect(page).to have_selector('.alert', text: 'Post was successfully created.')
        expect(page).to have_selector('h1', text: 'My New Post')
        expect(page).to have_selector('.post-body-full', text: 'My New Posts Body')
        expect(page).to have_selector('small', text: "by #{admin.full_name}")
      end
      it 'creates a post and tags it as a draft', js: true do
        uncheck 'post_published'
        click_button 'Create Post'
        expect(page).to have_selector('.alert', text: 'Post was successfully created.')
        expect(page).to have_selector('.badge', text: 'Draft')
      end
    end
    describe 'Edit Post' do
      it 'updates and displays a post', js: true do
        post_one = FactoryGirl.create :post
        visit edit_post_path(post_one)
        fill_in 'post[title]', with: 'My Updated Post'
        click_button 'Update Post'
        expect(page).to have_selector('.alert', text: 'Post was successfully updated.')
        expect(page).to have_selector('h1', text: 'My Updated Post')
        expect(page).to have_selector('.post-body-full', text: post_one.body.to_s)
        expect(page).to have_selector('small', text: "by #{admin.full_name}")
      end
    end
    describe 'Destroy Post', js: true do
      it 'destroys a post' do
        post_one = FactoryGirl.create :post
        visit posts_path
        accept_alert do
          click_link('Destroy')
        end
        expect(page).to have_selector('.alert', text: 'Post was successfully destroyed.')
        expect(page).not_to have_selector('tr', text: post_one.title)
      end
    end
  end
end
