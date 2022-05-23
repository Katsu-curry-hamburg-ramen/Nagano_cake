class Public::ItemsController < ApplicationController
    
def index
    @item = Item.find(params[:id])
    @quantity = Item.count
end

def show
    @item = Item.find(params[:id])
end
    
end