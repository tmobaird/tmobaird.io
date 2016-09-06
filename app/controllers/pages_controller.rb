class PagesController < ApplicationController
  def index
    @title = "Welcome!"
    @subtitle = "\"If at first you don't succeed, call it version 1.0.\""
    @logos = Dir.glob("app/assets/images/logos/*/*.png")
    @logos.delete_if { |file| file.include?("ruby") || file.include?("rspec") }
  end

  def contact
  end
end
