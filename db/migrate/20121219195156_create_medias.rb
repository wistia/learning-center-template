class CreateMedias < ActiveRecord::Migration
  def up
    create_table(:medias) do |t|
      t.column :hashed_id, :string
      t.column :name, :string
      t.column :duration, :string
      t.column :description, :text
      t.column :thumbnail, :string
      t.column :created, :datetime
      t.column :embed_code, :text
      t.column :media_id, :integer
    end
  end

  def down
    drop_table(:medias)
  end
end
