class SubscriptionsController < ApplicationController
  def create
    # cents
    @amount = 100

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    customer.subscriptions.create(plan: "basic")
    current_user.update_attribute(:paid, true)
    current_user.update_attribute(:stripe_customer_token, customer.id)

    updated_customer = Stripe::Customer.retrieve(current_user.stripe_customer_token)
    subscription_id = updated_customer.subscriptions.data.first.id
    current_user.update_attribute(:stripe_subscription_token, subscription_id)

    redirect_to edit_user_path(current_user), notice: "Thanks for subscribing!"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to subscribers_path
  end

  def destroy
    @customer = Stripe::Customer.retrieve(current_user.stripe_customer_token)
    @subscription = @customer.subscriptions.retrieve(current_user.stripe_subscription_token)

    @subscription.delete
    current_user.update_attribute(:paid, false)

    redirect_to edit_user_path(current_user),
      notice: "Subscription canceled. Sorry to see you go!"
  end
end
