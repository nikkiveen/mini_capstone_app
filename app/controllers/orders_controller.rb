class OrdersController < ApplicationController
  def create
    @carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id.to_i, "Carted")

    subtotal = 0

    @carted_products.each do |carted_product|
      subtotal = subtotal + (carted_product.product.price * carted_product.quantity)
    end
    
    tax = subtotal * 0.09
    total = subtotal + tax
    
    order = Order.create(
      user_id: current_user.id,
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
