class ItemsController < ApplicationController

  def show
    item = Project.find_by_slug(params[:id])
    item = Media.find_by_slug(params[:id]) unless item

    if item.is_a?(Project)
      @project = item
      @stylesheet = 'project'
      render 'projects/show'
    elsif item.is_a?(Media)
      @media = item
      @stylesheet = 'media'
      render 'medias/show'
    end

    raise ActiveRecord::RecordNotFound unless item
  end

end
