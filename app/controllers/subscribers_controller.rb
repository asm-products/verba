class SubscribersController < ApplicationController
  def new
  end

  def create
    # cents
    @amount = 100

    customer = Stripe::Customer.create(
      email: params[:email],
      card: params[:stripeToken]
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to subscribers_path
  end
end
