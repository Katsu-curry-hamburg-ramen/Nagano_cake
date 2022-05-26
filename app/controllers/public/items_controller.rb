class Public::ItemsController < ApplicationController
    
def index
    @items = Item.all
    @quantity = Item.count
    @genres = Genre.all
end

def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
end

def search
    @genre = Genre.find_by(genrename: params[:genre_name])
    @items = @genre.items
    @quantity = @items.count
    @genres = Genre.all
end
    
end