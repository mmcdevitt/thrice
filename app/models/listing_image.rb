class ListingImage < ActiveRecord::Base
  belongs_to :listing

  has_attached_file :listing_image, :default_url => "/assets/thrice-logo-bg.jpg", styles: {
    large: "650x500#",
    medium: "300x300#",
    small: "150x150#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :listing_image, :content_type => /\Aimage/

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:listing_image_file_name),
      "size" => read_attribute(:listing_image_file_size),
      "url" => listing_image.url(:original),
      "thumbnail_url" => listing_image.url(:thumb),
      "delete_url" => read_attribute(:id),
      "delete_type" => "DELETE"
    }
  end
end
