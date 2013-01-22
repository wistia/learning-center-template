class Slug < ActiveRecord::Base

  attr_accessible :hashed_id, :slug, :type, :active

end
