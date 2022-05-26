class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @subtotal = 0
    @total_price = 0
    @postage = 800
  end

  def status_update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if params[:order][:status] == "paid_up"
      @order.order_items.update_all(making_status: 1)
      # update_allにすることで注文商品の製作ステータスが更新される
    end
    redirect_to admin_order_path(@order)
  end

  def making_status_update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @one_order = @order.order_item

    if @order_item.update(order_item_params)
      if params[:order_item][:making_status] == "production"
        @order_item.order.update(status: 2)
      end

      if @one_order.count == @one_order.where(making_status: "complete").count
        # １件に紐づいたorderのorder_detailsの数 == 左辺のorder_detailsのmaking_statusがcompleteになっている数
        @order_item.order.update(status: 3)
      end
      redirect_to admin_order_path(@order_item.order_id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
    
  
end
