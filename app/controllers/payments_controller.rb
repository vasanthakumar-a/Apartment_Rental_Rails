class PaymentsController < ApplicationController

  def index
    if !(user_signed_in? or owner_signed_in?)
      redirect_to user_session_path
    end
  end

  def payment
    if user_signed_in?
      @user = current_user.id
      new_payment()
    elsif owner_signed_in?
      @owner = current_owner.id
      new_payment()
    else
      redirect_to user_session_path
    end
  end

  def new_payment
    if user_signed_in?
      @credits = User.find(current_user.id)
      @credits.credits += 10
    elsif owner_signed_in?
      @credits = Owner.find(current_owner.id)
      @credits.credits += 10
    else
      redirect_to user_session_path
    end

    if @credits.save
      redirect_to apartments_path
    else
      redirect_to payment_path
    end
  end

end

