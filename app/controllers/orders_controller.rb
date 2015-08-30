class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout :order_layout, only: :new

  def sales
    @transactions = Transaction.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  def new
    @order = Order.new
    @current_cart = current_cart
  end

  def create
    @order = Order.new(order_params)
    @current_cart = current_cart
    @order.buyer_id = current_user.id
    @order.subtotal = @current_cart.subtotal
    @order.add_line_items_from_cart(@current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      # @listing.update(active: false)
      create_transaction
      redirect_to root_url
      flash[:success] = "Thank you for ordering."
    else
      render 'new'
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(
        :address, :city, :state, :buyer_id, 
        :order_status_id, :subtotal, :tax, :shipping, :total, :first_name,
        :last_name, :second_address, :zipcode, :phone_number, :cc_name,
        :cc_number, :expiry_month, :expiry_year, :cc_cvv
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
          order_item_id: item.id,
          subtotal: item.total_price,
          total: item.total_price * 0.9
          )
      end
    end
end




































