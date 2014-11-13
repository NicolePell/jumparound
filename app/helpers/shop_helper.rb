module ShopHelper

  def item_price(item)
    "£#{'%.2f' % item.price}"
  end

  def buy_now(item)
    link_to "Buy Now", new_shop_charge_path(item)
  end

end
