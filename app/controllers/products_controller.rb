class ProductsController < ApplicationController
  def index
    @all_products = Product.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    render 'index.html.erb'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end
end
