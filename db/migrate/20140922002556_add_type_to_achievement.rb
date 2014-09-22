class AddTypeToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :type, :string
  end
end
