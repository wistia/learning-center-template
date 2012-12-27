class ChangeMediaIdToProjectId < ActiveRecord::Migration
  def up
    rename_column(:medias, :media_id, :project_id)
  end

  def down
    rename_column(:medias, :project_id, :media_id)
  end
end
