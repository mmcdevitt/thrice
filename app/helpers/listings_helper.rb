module ListingsHelper

  def listing_btn_title
    if params[:action] == 'new'
      'Step 2: Add Photos'
    elsif params[:action] == 'edit'
      'Update Listing'
    end
  end

  def size_title(listing)
    if params[:action] == 'edit'
      OptionItem.where(id: listing.option_item_id).first.value if listing.option_item_id
    elsif params[:action] == 'new'
      'Select size'
    end
  end

end
