class ItemsController < ApplicationController

  def show
    item = Slug.get_item(params[:id])

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
