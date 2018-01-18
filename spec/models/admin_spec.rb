# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { FactoryGirl.create(:admin, first_name: 'Thomas', last_name: 'Baird') }

  describe 'Relationships' do
    it { is_expected.to have_many :posts }
  end
  describe 'Methods' do
    describe '.full_name' do
      it 'returns Thomas Baird' do
        expect(admin.full_name).to eq('Thomas Baird')
      end
    end
  end
end
