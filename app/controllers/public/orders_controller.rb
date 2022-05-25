class Public::OrdersController < ApplicationController
  def new
      @order = Order.new
      @address = Address.new
  end

  def comfirm
     @order = current_customer.orders.new
     @order.payment_method =params[:payment_method]
     @order.postage = 800 #送料

     @total_price = 0 #商品合計金額
     current_customer.cart_items.each do |cart|
       subtotal_price = cart_item.item.price * cart_item.quantity * 110/100
       @total_price += subtotal_price
     end
     @order.total_payment = @totaal_price + @order.postage #請求金額＝商品合計金額＋送料

     if params[:address_id] == "0"
       @order.postcode = current_customer.postcode
       @order.address = current_customer.address
       @order.name = "#{current_customer.last_name}#{current_customer.first_name}"
     elsif params[:address_id] == "1"
       @address = Address.find(params[:address_select])
       @order.postcode = @address.postcode
       @order.address = @address.address
       @order.name = @address.name
     elsif params[:address_id] == "2"
       @address =current_customer.addresses.new(address_params)
        if @address.valid?
         @order.postcode = @address.postcode
         @order.address = @address.address
         @order.name =@address.name
        else
         render 'new'
        end
     end
  end

  def create
     @order = Order.new(order_params)
     @order.save
     current_customer.cart_items.each do |cart_item|
       order_item = OrderItem.new
       order_item.item_id = cart_item.item_id
       order_item.order_id = @order.id
       order_item.quantity = cart_item.quantity
       order_item.total_payment = cart_item.item.price * 110/100.0
       order_item.save
    end

       current_customer.cart_items.destroy_all
       redirect_to orders_thankyou_path
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
    @order_items = @order.order_
   end
end

  private
  def address_params
    params.require(:order).permit(:user_id,:payment_method,:total_payment,:postcode,:address,:name)
  end


