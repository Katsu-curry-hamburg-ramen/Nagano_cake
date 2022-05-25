class Admin::OrdersController < ApplicationController
  before_action :order_search
  before_action :authenticate_admin!
  
  def top
    range = Date.today.begining_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
  end
  
  def index
    @orders = Order.all
    @orders = @orders.page(params[:page]).reverse_order
  end
  
  def customer_index
    @orders = Order.where(customer_id: params[:customer_id])
    @orders = orders.page(params[page]).reverse_order
    render 'index'
  end
  
  def today_index
    range = Date.today.begining_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update 
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[notice] = "注文ステータスが更新されました。"
      if @order.order_status == "入金確認"
        @order.order_items.update(making_status: "制作待ち")
        flash[:success] = "制作ステータスが更新されました"
      end
      
    end
    redirect_to admin_order_path(@order)
  end
  
  private
  def order_params 
  params.require(:order).permit(:order_status)
  
  end
    
  
end
