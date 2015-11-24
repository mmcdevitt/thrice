class Post < ActiveRecord::Base
  # extend FriendlyId
  # friendly_id :title, use: :slugged

  belongs_to :user

  has_attached_file :post_image, :default_url => "assets/thrice-logo-bg.jpg", styles: {
    large: "650x500#",
    medium: "300x300#",
    small: "150x150#",
    thumb: "140x140#"
  },
  :storage => :s3,
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml')

  validates_attachment_content_type :post_image, :content_type => /\Aimage/

  def format_markdown
    markdown(self.content)
  end
end
