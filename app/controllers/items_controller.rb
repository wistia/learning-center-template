class ItemsController < ApplicationController

  def show
    item = Slug.where(key: params[:id]).first.try(:item)
    raise ActiveRecord::RecordNotFound unless item

    # Set the page title to the name of this item
    @title = item.name

    if item.is_a?(Project)
      @project = item
      @stylesheet = 'project'
      render 'projects/show'
    elsif item.is_a?(Media)
      @media = item
      @stylesheet = 'media'
      @stylesheets = "jcarousel_media.css"
      @javascripts = "jquery.jcarousel.min.js"
      render 'medias/show'
    else
      raise "Item is neither a Project or a Media. Whaaaaaaa?"
    end
  end

end
