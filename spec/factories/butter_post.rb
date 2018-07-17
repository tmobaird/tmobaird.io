class FakeButterPost
  def self.attributes(opts={})
    {
      "url" => opts[:url] || 'example-post',
      "created" => opts[:created] || '2018-07-07T16:30:19.300634Z',
      "published" => opts[:published] || '2018-07-07T16:30:00Z',
      "author" => opts[:author] || {
        "first_name" => "Thomas",
        "last_name" => "Baird",
        "email" => "test@testing.com",
        "slug" => "my-slug",
        "bio" => "sample bio",
        "title" => "sample title",
        "linkedin_url" => "linkedin.com",
        "facebook_url" => "facebook.com",
        "instagram_url" => "instagram.com",
        "pinterest_url" => "pinterest.com",
        "twitter_handle" => "twitter.com",
        "profile_image" => "github.com"
      },
      "status" => opts[:status] || 'published',
      "summary" => opts[:summary] || 'This is an example blog post. Pretty neat huh?',
      "body" => opts[:body] || '<p>Welcome to ButterCMS! This an example blog post written using Butter.</p>',
      "title" => opts[:title] || 'First Blog Post',
      "tags" => opts[:tags] || [{ 'name' => "First Tag", 'slug' => "first-tag" },
                                { 'name' => "Second Tag", 'slug' => "second-tag" }],
      "categories" => opts[:categories] || [{ 'name' => "First Category", 'slug' => "first-category" },
                                            { 'name' => "Second Category", 'slug' => "second-category" }],
      "slug" => opts[:slug] || 'first-blog-post',
      "featured_image" => opts[:featured_image] || 'featuredimage.com',
      "seo_title" => opts[:seo_title] || 'Example Post SEO Optimized Title',
      "meta_description" => opts[:meta_description] || 'This is our example blog posts SEO optimized meta description.'
    }
  end
end

FactoryGirl.define do
  factory :butter_author, class: OpenStruct
  factory :butter_post, class: ButterCMS::Post do
    transient do
      data FakeButterPost.attributes
    end

    skip_create
    initialize_with do
      new(
        { "data" => data }
      )
    end
  end

  factory :butter_posts, class: ButterCMS::ButterCollection do
    transient do
      meta { {} }
      raw_posts [FakeButterPost.attributes]
    end

    skip_create
    initialize_with do
      new(ButterCMS::Post, {
        "data" => raw_posts,
        "meta" => meta
      })
    end
  end
end
