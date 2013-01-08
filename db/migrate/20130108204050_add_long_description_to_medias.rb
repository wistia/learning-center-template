class AddLongDescriptionToMedias < ActiveRecord::Migration
  def change
    add_column(:medias, :long_description, :text)
  end
end
