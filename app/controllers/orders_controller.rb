class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])

    subtotal = product.price.to_i * params[:quantity].to_i
    tax = product.tax.to_i * params[:quantity].to_i
    total = product.total.to_i * params[:quantity].to_i
    
    order = Order.create(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: subtotal,
      tax: tax,
      total: total
    ) 

    flash[:success] = "Order has been successfully placed!"   
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
