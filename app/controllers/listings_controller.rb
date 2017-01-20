class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]

  def index
    @listings = current_user.listings

  end

  def show
    @photos = @listing.photos
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
    if @listing.update(listing_params)
      redirect_to :back, notice: "更新できました"
    end
  end

  def basics
    #basics ~ publishまで同じ項目を記載するのでset_listingでまとめる
    # @listing = Listing.find(params[:id])
  end

  def description
  end
  
  def address
  end

  def price
  end
  
  def photos
    @photo = Photo.new
  end
  
  def calendar
  end

  def bankaccount
  end
  
  def publish
  end

  private
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight, :active, :addressi, :listing_title, :listing_content)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
