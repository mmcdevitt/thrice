class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  # before_action :redirect_if_sold, only: [:show]
  add_breadcrumb "Home", :root_path

  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  def index
    @listings = current_user.listings.not_sold
    @order_item = current_cart.order_items.new
  end

  def show
    @order_item = current_cart.order_items.new
    @listing_image = @listing.listing_images.first
  end

  def new
    @listing = Listing.new
  end

  def edit
    add_breadcrumb 'Listings', listings_path
    add_breadcrumb @listing.name, @listing
    add_breadcrumb "Edit", ''
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to images_path(@listing), notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url }
      format.json { head :no_content }
    end
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(
        :name,
        :description,
        :sold,
        :active,
        :category_id,
        :designer_name,
        :size_id,
        :color,
        :tags_attached,
        :wear_and_tear,
        :selling_price,
        :published
        )
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end

    def redirect_if_sold
      redirect_to root_path if @listing.active == false
    end
end
























