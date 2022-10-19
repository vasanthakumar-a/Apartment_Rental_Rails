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
    @payment_history = PaymentHistory.new()
    @payment_history.message = "Created Payment for adding credits"
    @payment_history.mode = "Credit Card"
    @payment_history.credits_increment = 10
    if user_signed_in?
      @credits = User.find(current_user.id)
      @credits.credits += 10
      @payment_history.user_id = current_user.id
    elsif owner_signed_in?
      @credits = Owner.find(current_owner.id)
      @credits.credits += 10
      @payment_history.owner_id = current_owner.id
    else
      redirect_to user_session_path
    end

    if @credits.save and @payment_history.save
      redirect_to apartments_path
    else
      redirect_to payment_path
    end
  end

  def reduce_credit
    @payment_history = PaymentHistory.new()
    @payment_history.message = "Reduced 1 Credit for Viewing Owner Detail"
    @payment_history.mode = "Coin"
    @payment_history.credits_decrement = 1
    if user_signed_in?
      @credits = User.find(current_user.id)
      @credits.credits -= 1
      @payment_history.user_id = current_user.id
    elsif owner_signed_in?
      @credits = Owner.find(current_owner.id)
      @credits.credits -= 1
      @payment_history.owner_id = current_owner.id
    else
      redirect_to user_session_path
    end

    if @credits.save and @payment_history.save
      redirect_to owner_details_path
    else
      redirect_to apartments_path
    end
  end

  def history
    if user_signed_in?
      @credits = User.find(current_user.id)
      @payment_history = PaymentHistory.filter_history_by_user_id(current_user.id)
    elsif owner_signed_in?
      @credits = Owner.find(current_owner.id)
      @payment_history = PaymentHistory.filter_history_by_owner_id(current_owner.id)
    else
      redirect_to user_session_path
    end
  end
end

