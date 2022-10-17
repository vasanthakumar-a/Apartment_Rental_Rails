class ApartmentsController < ApplicationController

  # before_action (:authenticate_user! or :authenticate_owner!)

  def index
    @apartments = Apartment.order(:apartment_name).page(params[:page]).per(2)
  end

  def list
    @apartments = Apartment.filter_by(params[:search].downcase).order(:apartment_name).page(params[:page]).per(2) if params[:search].present?
  end

  def my_apartment
    @current_owner = current_owner.id
    @apartments = Apartment.filter_by_owner_id(@current_owner).order(:apartment_name).page(params[:page]).per(2) if @current_owner.present?
    puts "#######\n",@current_owner
  end

  def owner_details
    @apartment = Apartment.find(params[:id])
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
      :owner => [:id],
      image: []
    )
  end
end
