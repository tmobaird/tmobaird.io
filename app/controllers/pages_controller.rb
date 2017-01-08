class PagesController < ApplicationController
  def index
    info = YAML.load_file('app/views/pages/info.yml')
    @title = info["title"]
    @subtitle = info["subtitle"]
    @logos = Dir.glob("app/assets/images/logos/*/*.png")
    @logos.delete_if { |file| file.include?("ruby") || file.include?("rspec") }
    @bios = info["bio"]
    @projects = Project.all
  end

  def contact
  end
end
