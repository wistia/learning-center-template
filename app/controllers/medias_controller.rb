class MediasController < ApplicationController
  def show
    @stylesheet = "media"
    @media = Media.where(id: params[:id]).first
  end
end
