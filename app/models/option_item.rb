class OptionItem < ActiveRecord::Base
  belongs_to :option
  belongs_to :category
end
