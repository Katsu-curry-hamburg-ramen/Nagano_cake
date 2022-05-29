class HomesController < ApplicationController
  def top
    @items = Item.all
    @quantity = Item.count
    @genres = Genre.all
  end

  def about
  end
end
