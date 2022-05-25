class Public::ItemsController < ApplicationController
    
def index
    @item = Item.find(params[:id])
    @items = Item.all
    @quantity = Item.count
end

def show
    @item = Item.find(params[:id])
end

def search
    
end
    
end