class Listing < ActiveRecord::Base
  validates :name, :description, presence: true
  # validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category

  has_many :order_items, :dependent => :destroy
  has_many :listing_images, :dependent => :destroy

  scope :not_sold, -> { where(active: true) }
  scope :sold, -> { where(sold: true) }

  accepts_nested_attributes_for :listing_images,
                                reject_if: proc { |attributes| attributes['image'].blank? },
                                allow_destroy: true


end
