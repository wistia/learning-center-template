class AddIsCurrentToProjects < ActiveRecord::Migration
  def change
    add_column(:projects, :is_current, :boolean)
  end
end
