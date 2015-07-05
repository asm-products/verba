class AddStripeFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_token, :string
    add_column :users, :stripe_subscription_token, :string
  end
end
