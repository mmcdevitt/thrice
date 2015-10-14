class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def active_listings
    listings.active
  end
end