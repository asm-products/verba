class CreateWritingPrompts < ActiveRecord::Migration
  def change
    create_table :writing_prompts do |t|
      t.string :prompt

      t.timestamps
    end
  end
end
