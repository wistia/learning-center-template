class RemoveEmbedCodeFromMedias < ActiveRecord::Migration
  def up
    remove_column(:medias, :embed_code)
  end

  def down
    add_column(:medias, :embed_code, :text)
  end
end
