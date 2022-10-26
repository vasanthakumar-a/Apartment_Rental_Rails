class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticated_user_or_owner?
    user_signed_in? or owner_signed_in?
  end

  def payment_history(message,mode,add)
    @payment_history = PaymentHistory.new()
    @payment_history.message = message
    @payment_history.mode = mode
    if add
      @payment_history.credits_increment = 10
    else
      @payment_history.credits_decrement = 1
    end
    if user_signed_in?
      @payment_history.user_id = current_user.id
    elsif owner_signed_in?
      @payment_history.owner_id = current_owner.id
    end

    @payment_history.save

  end

  def store_owner_details
    @owner_details = OwnerDetail.new()
    @owner_details.owner_id = current_owner.id if owner_signed_in?
    @owner_details.user_id = current_user.id if user_signed_in?
    @owner_details.apartments_id = @apartment.id
    @owner_details.apartment_owner_id = @apartment.owner_id

    @owner_details.save
  end

  def reduce_credit(message = "Used 1 Credit for Viewing Owner Detail")
    @apartment = Apartment.find(params[:id])

    @my_token = OwnerDetail.filter_by_apartment_owner(current_owner.id) if owner_signed_in?
    @my_token = OwnerDetail.filter_by_apartment_user(current_user.id) if user_signed_in?

    @my_token.each do |apartment_owner|
      if ( apartment_owner.apartment_owner_id == @apartment.owner_id and apartment_owner.apartments_id ==  @apartment.id )
      redirect_to owner_details_path and return
      end
    end

    if user_signed_in?

      @credits = User.find(current_user.id)
      if @credits.credits <= 0
        redirect_to payment_path and return
      end
      @credits.credits -= 1
    elsif owner_signed_in?

      @credits = Owner.find(current_owner.id)
      if @credits.credits <= 0
        redirect_to payment_path
        return
      end
      @credits.credits -= 1
    else
      redirect_to user_session_path
    end

    if @credits.save and payment_history(message,"Coin",false) and store_owner_details()
      redirect_to owner_details_path
    else
      redirect_to apartments_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phonenumber, :credits, :password, :profile_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phonenumber, :credits, :password, :remember_me, :profile_image])
  end
end
