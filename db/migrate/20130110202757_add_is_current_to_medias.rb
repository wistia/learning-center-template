class AddIsCurrentToMedias < ActiveRecord::Migration
  def change
    add_column(:medias, :is_current, :boolean)
  end
end
