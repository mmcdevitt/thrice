class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal

  # validates :address, :city, :state, presence: true

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end 
end
