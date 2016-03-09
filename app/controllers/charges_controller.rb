class ChargesController < ApplicationController
  def new
    @amount = @cart.total_price
  end

  def create
    # Amount in cents
    @amount = @cart.total_price
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "gifs_for_good",
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  #must log in before can click checkout
  #save cart contents to make a new order
  #mark order as paid
  #associate order with current user
  #save customer.id to user
  #clear cart
  #fix tests 
end
