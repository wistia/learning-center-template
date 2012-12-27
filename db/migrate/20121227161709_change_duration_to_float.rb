class ChangeDurationToFloat < ActiveRecord::Migration
  def up
    change_column(:medias, :duration, :float)
  end

  def down
    change_column(:medias, :duration, :string)
  end
end
