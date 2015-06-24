class SubscriptionsController < ApplicationController
  def create
    # cents
    @amount = 100

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Monthly subscription",
      currency: "usd"
    )

    current_user.update_attribute(:paid, true)

    redirect_to edit_user_path(current_user), notice: "Thanks for subscribing!"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to subscribers_path
  end
end
