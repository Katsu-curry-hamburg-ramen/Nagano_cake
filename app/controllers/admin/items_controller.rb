class Admin::ItemsController < ApplicationController
#before_action :authenticate_admin!
    
def new
    @item = Item.new(params[:id])
end
    
def index
    @item = Item.new(params[:id])
    @items = Item.all
end

def show
    @item = Item.find(params[:id])
end

def create
    @item = Item.new(item_params)
    if @item.save
    flash[:notice] = "登録されました"
    redirect_to admin_item_path(@item.id)
    else
    flash.now[:alert] = "登録に失敗しました"
    render :new
    end
end

def edit
    @item = Item.find(params[:id])
end

def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    flash[:notice] = "変更が保存されました"
    redirect_to admin_item_path(@item.id)
    else
    flash.now[:alert] = "変更の保存に失敗しました"
    render :edit
    end
end

private

def item_params
    params.require(:item).permit(:product_image, :name, :body, :genre_id, :price, :is_active)
end
end
