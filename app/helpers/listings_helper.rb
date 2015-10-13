module ListingsHelper

  def listing_btn_title
    if params[:action] == 'new'
      'Continue'
    elsif params[:action] == 'edit'
      'Update Listing'
    end
  end

  def size_title(listing)
    if params[:action] == 'edit'
      OptionItem.where(id: listing.option_item_id).first.value
    elsif params[:action] == 'new'
      'Select size'
    end
  end

end
