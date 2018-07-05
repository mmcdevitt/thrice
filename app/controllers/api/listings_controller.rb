module Api
  class ListingsController < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    # before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy, :index]asdf

    def index
      @listings = Listing.all
      render json: @listings
    end

    def show
      render json: @listing
    end

    def create
      @listing = Listing.new(listings_params)
      # @listing.user_id = current_user.idasdfasfasdfasdfasdf

      if @listing.save
        head 200
      else
        head 500
      end
    end

    private

    def set_listing
      @listing = Listing.friendly.find(params[:id]).decorate
    end

    def listings_params
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
  end
end