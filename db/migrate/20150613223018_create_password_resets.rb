class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.string :token
      t.boolean :used, default: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
