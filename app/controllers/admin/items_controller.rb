class Admin::ItemsController < ApplicationController
before_action :authenticate_admin_user!
    
def index
    @item = Item.new(params[:id])
    @items = Item.page(params[:page]).per(10)
end

def show
    
end

def create
   @item = Item.new(item_params)
end

def edit
    
end

def update
end
    
end
