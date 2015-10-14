class User < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
  has_many :transactions

  # Before Thrice's 10% cut
  def sub_total_earnings
    number_to_currency Transaction.where(seller_id: self).sum(:subtotal)
  end

  # After Thrice's 10% cut
  def total_earnings
    number_to_currency Transaction.where(seller_id: self).sum(:total)
  end

  def total_sales
    Transaction.where(seller_id: self).count
  end

  def listings_sold
    self.listings.sold.count
  end

  def active_listings
    self.listings.active
  end

  def number_of_active_listings
    self.active_listings.count
  end

  def to_param
    username
  end
end
