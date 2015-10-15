class Transaction < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :order
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :order_item

  def to_currency
    number_to_currency(self.subtotal)
  end

  def after_thrice_cut
    number_to_currency(self.total)
  end

  def buyer_name
    User.find(self.order.buyer_id).username
  end

  def order_date
    self.created_at.strftime("%B %-d, %Y")
  end

  def name
    self.order_item.listing.name
  end
end
