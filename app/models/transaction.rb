class Transaction < ActiveRecord::Base
  belongs_to :order
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :order_item
end
