class CreateSlugs < ActiveRecord::Migration
  def up
    create_table(:slugs) do |t|
      t.string :hashed_id, null: false
      t.string :key, null: false
      t.string :resource_type, null: false
      t.boolean :active, null: false, default: false
    end

    add_index :slugs, :hashed_id
    add_index :slugs, :key, unique: true
    add_index :slugs, :resource_type
  end

  def down
    remove_index :slugs, :hashed_id
    remove_index :slugs, :key
    remove_index :slugs, :resource_type

    drop_table(:slugs)
  end
end
