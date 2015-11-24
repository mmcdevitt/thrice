class ListingImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Upload Photos", ''

  def index
    @images = @listing.listing_images.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images.map{|image| image.to_jq_upload } }
    end
  end

  def create
    @image = @listing.listing_images.new(images_params)
    respond_to do |format|
      if @image.save
        format.html {
          render :json => [@image.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@image.to_jq_upload]}, status: :created }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @image = @listing.listing_images.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.html { redirect_to listing_images_url, notice: 'Image gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_listing
    @listing = Listing.friendly.find(params[:listing_id])
  end

  def images_params
    params.require(:listing_image).permit(:listing_id, :listing_image)
  end

end
