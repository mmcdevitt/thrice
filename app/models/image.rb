class Image < ActiveRecord::Base
  belongs_to :listing

  has_attached_file :image, :default_url => "/assets/thrice-logo-bg.jpg", styles: {
    large: "300x200#",
    medium: "300x300#",
    small: "150x150#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :image, :content_type => /\Aimage/

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "thumbnail_url" => image.url(:thumb),
      "delete_url" => read_attribute(:id),
      "delete_type" => "DELETE"
    }
  end
end
