class WishlistController < ApplicationController

  def index
    if user_signed_in? or owner_signed_in?
    @my_token = Wishlist.filter_by_apartment_owner(current_owner.id) if owner_signed_in?
    @my_token = Wishlist.filter_by_apartment_user(current_user.id) if user_signed_in?

    @apartments = []

    @my_token.each do |token|
      @apartment = Apartment.find(token.apartment_id)
      @apartments<<@apartment
    end
  else
    redirect_to user_session_path
  end
  end

  def show
    wishlist_delete()
    redirect_to wishlist_index_path and return
  end

  def wishlist_delete
    @wish = Wishlist.find(params[:id])
    @wish.destroy
  end

  def add
    @my_token = Wishlist.filter_by_apartment_owner(current_owner.id) if owner_signed_in?
    @my_token = Wishlist.filter_by_apartment_user(current_user.id) if user_signed_in?

    @wishlist = Wishlist.new()

    @my_token.each do |owner_wishlist|
      if ( owner_wishlist.apartment_id ==  params[:id].to_i )
        redirect_to root_path and return
      end
    end

    @wishlist.user_id = current_user.id if user_signed_in?
    @wishlist.owner_id = current_owner.id if owner_signed_in?
    @wishlist.apartment_id = params[:id]
    if @wishlist.save
      redirect_to payment_history_path
    end
  end

  def destroy
    puts "####################################"
  end

  private

  def apartment_params
    params.require(:apartment).permit(:apartment_name, :location,)
  end
end
