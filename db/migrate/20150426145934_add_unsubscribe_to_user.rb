class AddUnsubscribeToUser < ActiveRecord::Migration
  def change
    add_column :users, :unsubscribe, :boolean, default: false
  end
end
