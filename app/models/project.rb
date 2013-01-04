class Project < ActiveRecord::Base
  has_many :media, :class_name => "Media"
  attr_accessible :name, :description, :color, :hashed_id
  
  def total_media_duration
    total = media.sum(:duration) / 60
    total.round
  end

  def to_param
    hashed_id
  end
end
