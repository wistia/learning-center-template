require 'uri'

class Media < ActiveRecord::Base
  belongs_to :project

  attr_accessible :hashed_id, 
    :name,
    :duration,
    :short_description,
    :long_description,
    :thumbnail,
    :created,
    :embed_code,
    :project_id,
    :aspect_ratio,
    :position

  self.table_name = "medias"
  
  def medium_thumbnail
    uri = URI(thumbnail)
    uri.query = "image_crop_resized=260x146"
    uri.to_s
  end

  def to_param
    hashed_id
  end
end
