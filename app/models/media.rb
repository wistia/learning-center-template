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

  after_create :update_slugs


  def self.find_by_slug(slug)
    s = Slug.where(slug: slug, type: 'Media').first
    return nil unless s
    Media.where(hashed_id: s.hashed_id).first
  end


  def to_param
    Slug.where(hashed_id: hashed_id, type: 'Media', active: true).first.try(:slug)
  end


  def update_slugs
    # do nothing if the correct slug already exists
    s = Slug.where(type: 'Media', hashed_id: hashed_id, slug: name.parameterize, active: true).first
    return if s

    # if the slug exists but is not current, make it the current slug
    s = Slug.where(type: 'Media', hashed_id: hashed_id, slug: name.parameterize, active: false).first
    if s
      Slug.update_all([ 'active = ?', false ], [ "type = 'Media' and hashed_id = ?", hashed_id ])
      s.update_attribute(:active, true)
      return
    end

    # create the slug if necessary
    Slug.update_all([ 'active = ?', false ], [ "type = 'Media' and hashed_id = ?", hashed_id ])
    s = Slug.create(type: 'Media', hashed_id: hashed_id, slug: name.parameterize, active: true)
  end


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
    result = ChronicDuration.output(duration.to_i, :format => :chrono)
    if result =~ /^\d+$/
      result = "0:#{result}"
    end
    result
  end


end
