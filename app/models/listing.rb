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
  # # validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category

  has_many :order_items, :dependent => :destroy
  has_many :listing_images, :dependent => :destroy
  has_many :transactions
  has_many :comments

  scope :active, -> { where(sold: false, published: true ) }
  scope :published?, -> { where(published: true) }
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

end