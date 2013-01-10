class Project < ActiveRecord::Base
  has_many :media, :class_name => "Media"
  attr_accessible :name, :description, :color, :hashed_id, :position, :is_current

  default_scope where(:is_current => true)


  def total_media_duration
    total = media.sum(:duration) / 60
    total.round
  end


  def to_param
    hashed_id
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
