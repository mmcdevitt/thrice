class OrderItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :listing
  belongs_to :cart
  belongs_to :order
  belongs_to :seller, class_name: 'User'

  validate  :product_present
  validate  :order_present

  before_save :finalize

  after_create :save_seller_id

  after_save :set_listing_active_false

  after_destroy :set_listing_active_true

  def unit_price
    if persisted?
      self[:unit_price]
    else
      listing.selling_price
    end
  end

  def total_price
    unit_price
  end

  def is_listing_order_item?
    self.listing.sold == false
  end

  # def is_not_sold
  #   self.d
  # end

  private

  def product_present
    errors.add(:listing, 'is not valid or is not active.') if listing.nil?
  end

  def order_present
    errors.add(:cart, 'is not a valid order') if cart.nil?
  end

  def finalize
    self[:unit_price]  = unit_price
    self[:total_price] = self[:unit_price]
  end

  def save_seller_id
    listing = Listing.find(self.listing_id)
    seller = listing.user
    self.seller_id = seller.id
    self.save
  end

  def set_listing_active_false
    self.listing.update(active: false)
  end

  def set_listing_active_true
    self.listing.update(active: true)
  end
end
















