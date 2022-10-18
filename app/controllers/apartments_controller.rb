class ApartmentsController < ApplicationController

  # before_action :authenticated_user_or_owner?

  def index
    @apartments = Apartment.order(:apartment_name).page(params[:page]).per(2)
  end

  def list
    @apartments = Apartment.filter_by(params[:search].capitalize).order(:apartment_name).page(params[:page]).per(2) if params[:search].present?
    # @apartment = Apartment.filter_by_search_location(params[:search_location].downcase).order(:apartment_name).page(params[:page]).per(2) if params[:search_location].present?
  end

  def my_apartment
    if owner_signed_in?
      @apartments = Apartment.filter_by_owner_id(current_owner.id).order(:apartment_name).page(params[:page]).per(2) if current_owner.id.present?
    else
      redirect_to owner_session_path
    end
  end

  def owner_details
    if owner_signed_in? or user_signed_in?
      @apartment = Apartment.find(params[:id])
      @owner = Owner.find(@apartment.owner_id)
    else
      redirect_to user_session_path
    end
  end

  def reduce_credit
    if user_signed_in?
      @credits = User.find(current_user.id)
      @credits.credits -= 1
    elsif owner_signed_in?
      @credits = Owner.find(current_owner.id)
      @credits.credits -= 1
    else
      redirect_to user_session_path
    end
    @credits.save
  end
  def show
    @apartment = Apartment.find(params[:id])
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.owner_id = current_owner.id if owner_signed_in?

    if current_owner.credits > 0
      reduce_credit()
    else
      redirect_to payment_path and return
    end
    if @apartment.save
      redirect_to @apartment
    else
      render :new
    end
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])

    if @apartment.update(apartment_params)
      redirect_to @apartment
    else
      render :edit
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect_to root_path
  end

  private
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
