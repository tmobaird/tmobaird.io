class PagesController < ApplicationController
  def index
    @title = "Welcome!"
    @subtitle = "\"If at first you don't succeed, call it version 1.0.\""
    @logos = Dir.glob("app/assets/images/logos/*/*.png")
  end

  def contact
  end
end
