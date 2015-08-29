class Listing < ActiveRecord::Base
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  has_many :order_items

  scope :not_sold, -> { where(active: true) }
  scope :sold, -> { where(sold: true) }

  has_attached_file :image, :default_url => "/assets/office1.jpg", styles: {
    large: "300x200#",
    medium: "300x300#",
    small: "150x150#",
    thumb: "140x140#"

  }
  # ,
  # :storage => :s3,
  # :bucket => ENV['LEASIFY'],
  # :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  validates_attachment_content_type :image, :content_type => /\Aimage/
end
