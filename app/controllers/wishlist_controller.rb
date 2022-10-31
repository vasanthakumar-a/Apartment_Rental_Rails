class WishlistController < ApplicationController

  def index
    if user_signed_in? or owner_signed_in?
      @wishlists = Wishlist.filter_by_apartment_owner(current_owner.id) if owner_signed_in?
      @wishlists = Wishlist.filter_by_apartment_user(current_user.id) if user_signed_in?
    else
      redirect_to user_session_path
    end
  end

  def show
    if wishlist_delete()
      redirect_to wishlist_index_path and return
    else
      redirect_to user_session_path and return
    end
  end

  def wishlist_delete
    @wish = Wishlist.find(params[:id])
    @wish_user_id = (@wish.user_id == current_user.id) if user_signed_in?
    @wish_user_id = (@wish.owner_id == current_owner.id) if owner_signed_in?
    if @wish_user_id
      @wish.destroy
    end
  end

  def add
    @wishlist = Wishlist.new()
    @wishlist.user_id = current_user.id if user_signed_in?
    @wishlist.owner_id = current_owner.id if owner_signed_in?
    @wishlist.apartment_id = params[:id]
    @wishlist.save
    redirect_back(fallback_location: root_path)
  end

  private

  def apartment_params
    params.require(:apartment).permit(:apartment_name, :location)
  end
end
