class AddVariousIndexes < ActiveRecord::Migration
  def change
    add_index :achievements, :user_id
    add_index :posts, :user_id
    add_index :posts, :prompt_id
  end
end
