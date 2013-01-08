class RenameDescriptionToShortDescription < ActiveRecord::Migration
  def up
    rename_column(:medias, :description, :short_description)
  end

  def down
    rename_column(:medias, :short_description, :description)
  end
end
