class ApartmentsController < ApplicationController

  before_action :find_apartment, only: [:show, :edit, :update, :destroy]

  def index
    @apartments = Apartment.order(:apartment_name).page(params[:page]).per(2)
  end

  def list
    if params[:search].present?
      @apartments = Apartment.filter_by(params[:search].capitalize).filter_by_search_location(params[:search_location].downcase).order(:apartment_name).page(params[:page]).per(2)
    end
  end

  def my_apartment
    if owner_signed_in?
      @apartments = Apartment.filter_by_owner_id(current_owner.id).order(:apartment_name).page(params[:page]).per(2)
    else
      redirect_to owner_session_path
    end
  end

  def owner_details
    if authenticated_user_or_owner?
      @apartment = Apartment.find(params[:id])
      @owner = Owner.find(@apartment.owner_id)
    else
      redirect_to user_session_path
    end
  end

  def show
    if authenticated_user_or_owner?
      @wishlists = ( user_signed_in? ?
        Wishlist.filter_by_apartment_user(current_user.id) :
        Wishlist.filter_by_apartment_owner(current_owner.id)
      ).select(:apartment_id)

      @wishlist_apartment_id = []
      @wishlists.each do |wishlist|
        @wishlist_apartment_id << wishlist.apartment_id
      end
    end
  end

  def new
    if current_owner.credits > 0
      @apartment = Apartment.new
    else
      redirect_to payment_path and return
    end
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.owner_id = current_owner.id if owner_signed_in?
    reduce_credit()
    if @apartment.save
      redirect_to @apartment
    else
      render :new
    end
  end

  def reduce_credit
    if authenticated_user_or_owner?
      @credits = (user_signed_in?) ? User.find(current_user.id) : Owner.find(current_owner.id)
    else
      redirect_to user_session_path
    end
    @credits.credits -= 1
    if @credits.save
      payment_history("Apartment Created by using 1 Credit","Coin",false)
    end
  end

  def edit
  end

  def update
    if @apartment.update(apartment_params)
      redirect_to @apartment
    else
      render :edit
    end
  end

  def destroy
    @apartment.destroy
    redirect_to root_path
  end

  private

  def find_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(
      :apartment_name,
      :location,
      :description,
      :deposit,
      :rent,
      :review,
      :room_size,
      :bedrooms,
      :tenant,
      :building_age,
      :balcony,
      :furnishing_status,
      :bathrooms,
      :property_type,
      :lift,
      :wifi,
      :ac,
      :fire_safety,
      :security,
      :house_keeping,
      :water_supply,
      :parking,
      :sewage,
      :posted_date,
      :search,
      :search_location,
      :owner => [:id],
      :user => [:id],
      image: []
    )
  end

end
