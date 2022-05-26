class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = Order_item.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to request.referer
  end



  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :quantity, :status, :total_payment)
  end

end
