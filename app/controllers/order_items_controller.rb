class OrderItemsController < ApplicationController
  add_breadcrumb 'Home', :root_path
  add_breadcrumb 'Order Item', '/'

  def show
    @order_item = OrderItem.find(params[:id]).decorate
    add_breadcrumb @order_item.listing.name, '/'
  end

  def create
    @order = current_cart
    @order_item = @order.order_items.new(order_item_params)
    if @order.save
      if @order_item.is_listing_order_item?
        # Must get sidekiq on production, this is only
        # for development
        @order_item.delay_for(6.minute).destroy
      end
    end
    session[:cart_id] = @order.id
  end

  def update
    @order = current_cart
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_cart
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:listing_id, :order_id)
  end
end
