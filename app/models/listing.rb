class Listing < ActiveRecord::Base
  validates :name, :description, presence: true
  # validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category

  has_many :order_items, :dependent => :destroy
  has_many :listing_images, :dependent => :destroy

  scope :active, -> { where(sold: false, published: true ) }
  scope :sold, -> { where(sold: true) }

  accepts_nested_attributes_for :listing_images,
                                reject_if: proc { |attributes| attributes['image'].blank? },
                                allow_destroy: true


  def condition
    if self.tags_attached && !self.wear_and_tear
      'New with Tags'
    elsif self.tags_attached && self.wear_and_tear
      'Used with Tags'
    elsif !self.tags_attached && self.wear_and_tear
      'New without Tags'
    elsif !self.tags_attached && !self.wear_and_tear
      'Used without Tags'
    end
  end
end