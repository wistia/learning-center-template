class Slug < ActiveRecord::Base

  attr_accessible :hashed_id, :slug, :resource_type, :active


  def self.get_item(id)
    item = Project.find_by_slug(id)
    item = Media.find_by_slug(id) unless item
    item
  end

end
