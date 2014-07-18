class AddWordCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :word_count, :integer
  end
end
