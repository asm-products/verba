class CreateWritingPrompts < ActiveRecord::Migration
  def change
    create_table :writing_prompts do |t|
      t.text :prompt

      t.timestamps
    end
  end
end
