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

    redirect_to edit_user_path(current_user), notice: "Thanks for subscribing!"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to subscribers_path
  end
end
