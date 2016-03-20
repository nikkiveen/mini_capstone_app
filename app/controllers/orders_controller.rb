class OrdersController < ApplicationController
  def create
    subtotal = Product.find_by(id: params[:product_id]).price.to_i * params[:quantity].to_i
    tax = Product.find_by(id: params[:product_id]).tax.to_i * params[:quantity].to_i
    total = Product.find_by(id: params[:product_id]).total.to_i * params[:quantity].to_i
    
    order = Order.create(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: subtotal,
      tax: tax,
      total: total
    ) 

    redirect_to "/orders/#{order.id}"
  end

  def show
    render 'show.html.erb'
  end
end
