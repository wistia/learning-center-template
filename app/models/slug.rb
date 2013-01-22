class Slug < ActiveRecord::Base

  attr_accessible :hashed_id, :key, :resource_type, :active


  def item
    if resource_type == 'Project'
      Project.where(hashed_id: hashed_id).first
    elsif resource_type == 'Media'
      Media.where(hashed_id: hashed_id).first
    end
  end

end
