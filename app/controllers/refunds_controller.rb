class RefundsController < ApplicationController
  def create
    return if !current_user.eligible_for_refund?

    @refund = Refund.new(user_id: current_user.id)

    if @refund.save
      redirect_to edit_user_path(current_user),
        notice: "You will be refunded in the next few days!"
    end
  end
end
