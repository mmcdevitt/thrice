class User < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
  has_many :transactions
  has_many :comments
  has_many :ratings
  has_many :posts
  has_many :relationships, foreign_key: :follower_id
  has_many :followings, through: :relationships
  has_many :followers, through: :relationships

  # scope :myfollowers, -> { Relationship.where(following_id: self).count }

  def follows?(another_user)
    relationships.map(&:following).include?(another_user)
  end

  def follow(another_user)
    relationships.create(following: another_user)
  end

  def can_follow?(another_user)
    !(self.follows?(another_user) || self == another_user)
  end

  def is_not(another_user)
    self != another_user
  end

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

  def short_address
    if !self.city.empty? && !self.state.empty?
      self.city + ", " + self.state
    end
  end
end
