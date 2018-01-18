# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @info = YAML.load_file('app/views/pages/info.yml')
    @skills = YAML.load_file('app/views/pages/skills.yml')
    @title = @info['title']
    @subtitle = @info['subtitle']
    @bios = @info['bio']
    @projects = Project.all
  end

  def contact; end
end
