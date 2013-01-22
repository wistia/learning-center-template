class ItemsController < ApplicationController

  def show
    item = Slug.where(key: params[:id]).first.try(:item)

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
