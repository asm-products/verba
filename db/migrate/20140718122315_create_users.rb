class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.string :email
      t.string :phone_number
      t.integer :longest_streak, default: 0

      t.timestamps
    end
  end
end
