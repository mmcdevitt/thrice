class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :publish]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy, :index]
  before_action :check_user, only: [:edit, :update, :destroy]
  # before_action :redirect_if_sold, only: [:show]
  add_breadcrumb "Home", :root_path

  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  def all
    @listings = Listing.active.decorate
    add_breadcrumb "Collections", ''
  end

  def index
    # @filterrific = initialize_filterrific(
    #   Listing,
    #   params[:filterrific],
    #   select_options: {
    #     sorted_by: Listing.options_for_sorted_by,
    #     with_category: Listing.options_for_select
    #   }
    # ) or return
    # @listings = @filterrific.find.page(params[:page])
    # @listings = current_user.listings.filterrific_find(@filterrific).page(params[:page]).with_category

    @listings = current_user.listings.all.decorate
    @order_item = current_cart.order_items.new
    add_breadcrumb "Your Listings", ''

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    if !@listing.published? && @listing.user != current_user
      redirect_to root_path
    end
    @comments = @listing.comments.all.order("created_at DESC")
    @order_item = current_cart.order_items.new
    @listing_image = @listing.listing_images.first
    add_breadcrumb @listing.category.title, @listing.category
    add_breadcrumb @listing.name, ''
  end

  def new
    @listing = Listing.new
    add_breadcrumb "List an Item", ''
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

  def publish
    add_breadcrumb 'Listings', listings_path
    add_breadcrumb @listing.name, @listing
    add_breadcrumb "Publish Listing", ''
  end

  private
    def set_listing
      @listing = Listing.find(params[:id]).decorate
    end

    def listing_params
      params.require(:listing).permit(
        :name,
        :description,
        :sold,
        :active,
        :category_id,
        :designer_name,
        :option_item_id,
        :color,
        :tags_attached,
        :wear_and_tear,
        :selling_price,
        :published,
        :best_offer
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
























