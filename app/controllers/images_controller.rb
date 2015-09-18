class ImagesController < ApplicationController
  before_action :set_listing

  def index
    @images = @listing.images.all
  end

  def create
    @image = @listing.images.new(images_params)
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

  def update
  end

  def destroy
  end

  private
  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def images_params
    params.require(:image).permit(:listing_id, :image)
  end

end
