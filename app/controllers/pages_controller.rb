class PagesController < ApplicationController
  def index
    info = YAML.load_file('app/views/pages/info.yml')
    @title = info["title"]
    @subtitle = info["subtitle"]
    @bios = info["bio"]
    @skills = YAML.load_file('app/views/pages/skills.yml')
    @projects = Project.all
  end

  def contact
  end
end
