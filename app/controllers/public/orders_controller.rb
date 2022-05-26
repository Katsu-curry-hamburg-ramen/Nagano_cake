class Public::OrdersController < ApplicationController
  def new
      @order = Order.new
  end

 def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @total_price = 0
    @order.postage = 800
    if params[:order][:my_address] == "0"
      @order.postcode = current_customer.postcode
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
    elsif params[:order][:my_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.name = @address.name
      @order.address = @address.address
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    if @order.save
        @cart_items = current_customer.cart_items
        @cart_items.each do |cart_item|
        @order_items = OrderItems.new
        @order_items.order_id = @order.id
        @order_items.item_id = cart_item.item.id
        @order_items. total_payment = cart_item.item.with_tax_price
        @order_items. quantity = cart_item.quantity
        @order_items.status = 0
        @order_items.save
      end
      current_customer.cart_items.destroy_all
      redirect_to thankyou_path
    end
  end


 def thankyou
 end




 def index
    @orders = current_customer.orders.all
 end




   def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @total_price = 0
    @subtotal = 0
    @order_items = @order.order_items
   end


   private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :postage, :total_payment, :payment_method)
  end
end

