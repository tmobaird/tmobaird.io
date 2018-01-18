# frozen_string_literal: true

class Admin < ApplicationRecord
  has_many :posts

  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
