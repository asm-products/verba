class AddPromptIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :prompt_id, :integer
  end
end
