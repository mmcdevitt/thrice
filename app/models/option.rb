class Option < ActiveRecord::Base
  belongs_to :category

  has_many :option_items, :dependent => :destroy
end
