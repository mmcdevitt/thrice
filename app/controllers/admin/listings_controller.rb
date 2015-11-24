class Admin::ListingsController < AdminsController
  def index
    @listings = Listing.all
  end
end