module ListingsHelper

  def listing_status(listing)
    listing.sold == true ? 'Sold' : 'Active'
  end

end
