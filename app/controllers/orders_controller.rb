class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirmation]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :confirmation]

  add_breadcrumb "Home", :root_path

  layout :order_layout, only: :new

  def sales
    @transactions = Transaction.all.where(seller: current_user).order("created_at DESC")
    add_breadcrumb "Your Sales", ''
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC").decorate
    add_breadcrumb "Your Purchase History", ''
  end

  def confirmation
  end

  def show
    add_breadcrumb "Order ##{@order.id}", ''
  end

  def new
    if current_cart.order_items.count == 0
      redirect_to root_path
      flash[:danger] = 'Your cart is empty.'
    end
    @order = Order.new
    @current_cart = current_cart
  end

  def create
    # begin
    @order = Order.new(order_params)
    # @current_cart = current_cart
    @order.buyer_id = current_user.id
    @order.subtotal = current_cart.subtotal
    @order.add_line_items_from_cart(current_cart)
    @total = (@order.subtotal * 100).floor

    token = params[:stripeToken]

    charge = StripeWrapper::Charge.create(
        :amount => @total,
        :card => token,
        :description => "Thrice Charge - Order ##{@order.id}"
      )

    if charge.successful? && @order.save
      destroy_cart
      create_transaction
      send_email_to_seller
      send_email_to_buyer
      redirect_to confirmation_order_path(@order)
      flash[:success] = 'Payment was successful.'
    else
      flash[:danger] = charge.message
    end
    # rescue Stripe::InvalidRequestError
    #   redirect_to root_path
    #   flash[:danger] = 'Your order was not processed. You waited too long to order.'
    # end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :address, :city, :state, :buyer_id,
      :order_status_id, :subtotal, :tax, :shipping, :total, :first_name,
      :last_name, :second_address, :zipcode, :phone_number
      )
  end

  def order_layout
    'order'
  end

  def create_transaction
    @order.order_items.all.each do |item|
      Transaction.create(
        order_id: @order.id,
        seller_id: item.seller_id,
        buyer_id: current_user.id,
        subtotal: item.total_price,
        total: item.total_price * 0.9,
        listing_id: item.listing_id
        )
    end
  end

  def send_email_to_seller
    @order.order_items.all.each do |item|
      AppMailer.notify_on_new_order(item.listing.user, item).deliver
    end
  end

  def send_email_to_buyer
    AppMailer.notify_buyer(@order.buyer, @order).deliver
  end

  def destroy_cart
    current_cart.destroy
    session[:cart_id] = nil
  end

  def correct_user
    if current_user.id != @order.buyer_id
      redirect_to root_path
    end
  end
end




































