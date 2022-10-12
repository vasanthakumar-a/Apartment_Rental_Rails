class ApartmentsController < ApplicationController

  before_action :authenticate_user!, except: %i[home]

  def index

    @apartments = Apartment.order(:apartment_name).page(params[:page]).per(2)

    @apartments = Apartment.filter_by_starts_with(params[:search]) if params[:search].present?

    if @apartments_filter
      redirect_to :list
    end
  end

  def list
    @apartments = Apartment.order(:apartment_name).page(params[:page]).per(2)
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)

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
    params.require(:apartment).permit(:apartment_name, :location, :description, :price, :review, :room_size, :ac, :tv, :wifi, :cctv, :house_keeping, :search)
  end
end
