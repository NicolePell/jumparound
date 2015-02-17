class ItemController < ApplicationController

  def create
    @item = Item.create(item_params)
    redirect_to '/shop'
  end

end

def item_params
  params.require(:item).permit(:name, :price, :description, :image)
end
