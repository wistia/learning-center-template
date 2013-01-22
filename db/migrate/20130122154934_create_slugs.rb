class CreateSlugs < ActiveRecord::Migration
  def up
    create_table(:slugs) do |t|
      t.string :hashed_id, null: false
      t.string :slug, null: false
      t.string :type, null: false
      t.boolean :active, null: false, default: false
    end

    add_index :slugs, :hashed_id
    add_index :slugs, :slug, unique: true
    add_index :slugs, :type
  end

  def down
    remove_index :slugs, :hashed_id
    remove_index :slugs, :slug
    remove_index :slugs, :type

    drop_table(:slugs)
  end
end
