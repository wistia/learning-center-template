require 'friendly_ids'

class Project < ActiveRecord::Base
  has_many :media, :class_name => "Media"
  attr_accessible :name, :description, :color, :hashed_id, :position, :is_current

  default_scope where(:is_current => true)

  after_create :update_slugs

  include FriendlyIds


  def self.find_by_slug(slug)
    s = Slug.where(slug: slug, resource_type: 'Project').first
    return nil unless s
    Project.where(hashed_id: s.hashed_id).first
  end


  def total_media_duration
    total = media.sum(:duration) / 60
    total.round
  end


  def hex_color
    case self.color
    when "green"
      "87D452"
    when "sea_foam"
      "5AD4A0"
    when "blue"
      "63D0DB"
    when "purple"
      "5c9ed6"
    end
  end


end
