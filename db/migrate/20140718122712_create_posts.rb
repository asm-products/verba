class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :points
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
