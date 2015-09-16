class OrderItem < ActiveRecord::Base
  belongs_to :listing
  belongs_to :cart
  belongs_to :order
  belongs_to :seller, class_name: 'User'
  has_many :transactions

  validate  :product_present
  validate  :order_present

  before_save :finalize
  after_create :save_seller_id

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
end
