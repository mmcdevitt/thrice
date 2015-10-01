module ListingsHelper

  def listing_btn_title
    if params[:action] == 'new'
      'Continue'
    elsif params[:action] == 'edit'
      'Update Listing'
    end
  end

end
