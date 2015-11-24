class PagesController < ApplicationController
  before_action :authenticate_user!
  add_breadcrumb 'Home', :root_path

  def about
    add_breadcrumb 'About', '/'
  end

  def contact
    add_breadcrumb 'Contact', '/'
  end

  def how_it_works
    add_breadcrumb 'How it Works', '/'
  end
end
