class OrderStatus < ActiveRecord::Base
  has_many :carts
end
