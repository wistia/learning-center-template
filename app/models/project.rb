class Project < ActiveRecord::Base
  has_many :media, :class_name => "Media"
  attr_accessible :name, :description
  
  def total_media_duration
    total = media.sum(:duration) / 60
    total.round
  end

end
