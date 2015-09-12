class Category < ActiveRecord::Base
  has_many :listings

  def to_param
    title
  end
end
