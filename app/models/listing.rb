class Listing < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  validates :name, :description, presence: true
  # validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category

  has_many :order_items, :dependent => :destroy
  has_many :listing_images, :dependent => :destroy

  scope :active, -> { where(sold: false, published: true ) }
  scope :sold, -> { where(sold: true) }
  # scope :with_category, lambda { |categories| where(category_id: [*categories]) }
  # scope :sorted_by, lambda { |sort_key|
  #   # Sorts students by sort_key
  # }

  accepts_nested_attributes_for :listing_images,
                                reject_if: proc { |attributes| attributes['image'].blank? },
                                allow_destroy: true


  # filterrific(
  #   default_filter_params: { sorted_by: 'created_at_desc' },
  #   available_filters: [
  #     :sorted_by,
  #     :with_category
  #   ]
  # )

  # def self.options_for_sorted_by
  #   [
  #     ['Name (a-z)', 'name_asc'],
  #     ['Registration date (newest first)', 'created_at_desc'],
  #     ['Registration date (oldest first)', 'created_at_asc'],
  #     ['Country (a-z)', 'country_name_asc']
  #   ]
  # end

  # def self.options_for_select
  #   order('LOWER(name)').map { |e| [e.name, e.id] }
  # end

  def seller_name
    self.user.name
  end

  def to_currency
    number_to_currency self.selling_price
  end

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