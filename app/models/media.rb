require 'uri'
require 'chronic_duration'

class Media < ActiveRecord::Base
  belongs_to :project

  self.table_name = "medias"

  default_scope where(:is_current => true)


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
    :position,
    :is_current

  
  def medium_thumbnail
    uri = URI(thumbnail)
    uri.query = "image_crop_resized=260x146"
    uri.to_s
  end


  def index_in_project
    index = 0
    project.media.each do |m|
      return index if m == self
      index += 1
    end
    index
  end
  

  def duration_for_display
    ChronicDuration.output(duration.to_i, :format => :chrono)
  end


  def to_param
    hashed_id
  end


end
