class Project < ActiveRecord::Base
  has_many :media, :class_name => "Media"
  attr_accessible :name, :description, :color, :hashed_id, :position, :is_current

  default_scope where(:is_current => true)

  after_create :update_slugs


  def self.find_by_slug(slug)
    s = Slug.where(slug: slug, resource_type: 'Project').first
    return nil unless s
    Project.where(hashed_id: s.hashed_id).first
  end


  def to_param
    Slug.where(hashed_id: hashed_id, resource_type: 'Project', active: true).first.try(:slug)
  end


  def update_slugs
    # do nothing if the correct slug already exists
    s = Slug.where(resource_type: 'Project', hashed_id: hashed_id, slug: name.parameterize, active: true).first
    return if s

    # if the slug exists but is not current, make it the current slug
    s = Slug.where(resource_type: 'Project', hashed_id: hashed_id, slug: name.parameterize, active: false).first
    if s
      Slug.update_all([ 'active = ?', false ], [ "resource_type = 'Project' and hashed_id = ?", hashed_id ])
      s.update_attribute(:active, true)
      return
    end

    # create the slug if necessary
    Slug.update_all([ 'active = ?', false ], [ "resource_type = 'Project' and hashed_id = ?", hashed_id ])
    s = Slug.create(resource_type: 'Project', hashed_id: hashed_id, slug: name.parameterize, active: true)
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
