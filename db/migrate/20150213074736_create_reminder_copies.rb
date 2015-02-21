class CreateReminderCopies < ActiveRecord::Migration
  def change
    create_table :reminder_copies do |t|
      t.integer :week, null: false
      t.integer :day, null: false
      t.string :subject, null: false
      t.text :copy, null: false
      t.string :action

      t.timestamps null: false
    end
  end
end
