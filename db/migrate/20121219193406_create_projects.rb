class CreateProjects < ActiveRecord::Migration
  def up
    create_table(:projects) do |t|
      t.column :name, :string
      t.column :description, :text
    end
  end

  def down
    remove_table(:projects)
  end
end
