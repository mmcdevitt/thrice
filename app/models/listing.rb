class Listing < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  validates :name,           presence: true
  validates :description,    presence: true
  validates :category_id,    presence: true
  validates :designer_name,  presence: true
  # validates :option_item_id, presence: true
  # validates :tags_attached,  presence: true
  # validates :wear_and_tear,  presence: true
  # validates :selling_price,  presence: true
  # validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category

  has_many :order_items, :dependent => :destroy
  has_many :listing_images, :dependent => :destroy
  has_many :transactions
  has_many :comments
  has_many :watchers
  has_one :rating

  scope :active, -> { where(sold: false, published: true ) }
  scope :published?, -> { where(published: true) }
  scope :sold, -> { where(sold: true) }

  accepts_nested_attributes_for :listing_images,
                                reject_if: proc { |attributes| attributes['image'].blank? },
                                allow_destroy: true




end