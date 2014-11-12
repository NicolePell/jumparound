class ShopController < ApplicationController
  def index
    @items = Item.all
  end
end
