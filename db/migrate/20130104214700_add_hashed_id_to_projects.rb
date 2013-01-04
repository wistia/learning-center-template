class AddHashedIdToProjects < ActiveRecord::Migration
  def change
    add_column(:projects, :hashed_id, :string)
  end
end
