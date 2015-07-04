class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
