class Slug < ActiveRecord::Base

  attr_accessible :hashed_id, :slug, :resource_type, :active

end
