class AddPositionToMedias < ActiveRecord::Migration
  def change
    add_column(:medias, :position, :integer)
  end
end
