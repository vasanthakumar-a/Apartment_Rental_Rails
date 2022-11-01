class PaymentsController < ApplicationController

  def index
    unless authenticated_user_or_owner?
      redirect_to user_session_path
    end
  end

  def payment
    if user_signed_in?
      @user = current_user.id
    elsif owner_signed_in?
      @owner = current_owner.id
    else
      redirect_to user_session_path
    end
    new_payment()
  end

  def new_payment

    if authenticated_user_or_owner?
      @credits = user_signed_in? ? User.find(current_user.id) : Owner.find(current_owner.id)
    else
      redirect_to user_session_path
    end
    @credits.credits += 10
    if @credits.save and payment_history("Created Payment for Adding Credits","Credit Card",true)
      redirect_to apartments_path
    else
      redirect_to payment_path
    end
  end

  def history
    if authenticated_user_or_owner?
      @credits = user_signed_in? ? User.find(current_user.id) : Owner.find(current_owner.id)
      @payment_history = user_signed_in? ?
        PaymentHistory.filter_history_by_user_id(current_user.id) :
        PaymentHistory.filter_history_by_owner_id(current_owner.id)
    else
      redirect_to user_session_path
    end
  end
end

