class ListingsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
    # 現在のユーザーのリスティングの作成
    @listing = current_user.listings.build

  end

  def create
    # パラメーターを元にリスティングを作成
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成しました"
    else
      redirect_to new_listing_path, notice: "リスティングを作成できませんでした"
    end
  end

  def edit
  end

  def update
  end

  def basics
    @listing = Listing.find(params[:id])
  end

  def description
    @listing = Listing.find(params[:id])
  end

  private
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size)
  end

end
