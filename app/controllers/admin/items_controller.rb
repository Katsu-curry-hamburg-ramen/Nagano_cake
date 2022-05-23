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
end

def edit
    @item = Item.find(params[:id])
end

def update
    @item = Item.find(params[:id])
end

private

def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :validation)
end
end
