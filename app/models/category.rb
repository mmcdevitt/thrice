class Category < ActiveRecord::Base
  has_many :listings

  # scope :with_size, lambda { |sizes| self.listings.where(size_id: [*sizes]) }

  def to_param
    title
  end

  # filterrific(
  #   default_settings: { sorted_by: 'created_at_desc' },
  #   filter_names: [
  #     :sorted_by,
  #     :search_query,
  #     :with_size
  #   ]
  # )
end
