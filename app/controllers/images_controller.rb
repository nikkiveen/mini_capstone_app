class ImagesController < ApplicationController
  def new
    @product_id = params[:id]

    render 'new.html.erb'
  end

  def create
    product_id = params[:id]

    image = Image.create(
      src: params[:src],
      product_id: product_id)
    
    render 'create.html.erb'
  end 
end
