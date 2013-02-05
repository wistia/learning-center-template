require 'uri'
require 'chronic_duration'
require 'friendly_ids'

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

  include FriendlyIds

  after_create :update_slugs


  def next_video
    Media.where(project_id: project_id, position: position + 1).first
  end


  def previous_video
    Media.where(project_id: project_id, position: position - 1).first
  end


  def medium_thumbnail
    uri = URI(thumbnail)
    uri.query = "image_crop_resized=260x146"
    uri.to_s
  end


  def raw_thumbnail
    uri = URI(thumbnail)
    uri.query = nil
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
    result = ChronicDuration.output(duration.to_i, :format => :chrono)
    if result =~ /^\d+$/
      result = "0:#{result}"
    end
    result
  end


end
