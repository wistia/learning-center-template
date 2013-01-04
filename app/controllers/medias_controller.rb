class MediasController < ApplicationController
  def show
    @stylesheet = "media"
    @media = Media.where(hashed_id: params[:id]).first
  end
end
