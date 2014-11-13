class ChargesController < ApplicationController

  def new
    @item = Item.find(params[:shop_id])
  end

  def create
    @item = Item.find(params[:shop_id])
    @amount = (@item.price * 100).to_i
    @description = @item.name

    customer = Stripe::Customer.create(
    :email => User.find(current_user.id).email,
    :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer => customer.id,
    :amount => @amount,
    :description => @description,
    :currency => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to item_charges_path
  end

end
