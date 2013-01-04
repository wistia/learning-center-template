class AddDimensionsToMedias < ActiveRecord::Migration
  def change
    add_column(:medias, :aspect_ratio, :float)
  end
end
