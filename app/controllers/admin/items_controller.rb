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
    @item.save
    redirect_to admin_item_path(@item.id)
end

def edit
    @item = Item.find(params[:id])
end

def update
    @item = Item.find(params[:id])
end

private

def item_params
    params.require(:item).permit(:image, :name, :body, :genre_id, :price)
end
end
