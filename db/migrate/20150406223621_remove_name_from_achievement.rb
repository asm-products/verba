class RemoveNameFromAchievement < ActiveRecord::Migration
  def change
    remove_column :achievements, :name
  end
end
