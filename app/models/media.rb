class Media < ActiveRecord::Base
  belongs_to :project
  attr_accessible :hashed_id, :name, :duration, :description, :thumbnail, :created, :embed_code, :media_id
  self.table_name = "medias"
end
