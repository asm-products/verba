class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.text :content, null: false
      t.boolean :prompt_of_the_day, default: false
      t.boolean :on_deck, default: false
      t.boolean :used, default: false

      t.timestamps null: false
    end
  end
end
