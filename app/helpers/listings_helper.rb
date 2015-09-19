module ListingsHelper

  def listing_status(listing)
    listing.sold == true ? 'Sold' : 'Active'
  end

  def listing_btn_title
    if params[:action] == 'new'
      'Continue'
    elsif params[:action] == 'edit'
      'Update Listing'
    end
  end

end
