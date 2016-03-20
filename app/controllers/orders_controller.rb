class OrdersController < ApplicationController
  def create
    Order.create(
      quantity: params[:quantity],
      user_id: current_user
    ) 
    
    render 'create.html.erb'
  end
end
