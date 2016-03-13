class ProductsController < ApplicationController
  def index
    @all_products = Product.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image]
    )
    flash[:success] = "Product has been successfully created!"    
    redirect_to "/products/#{product.id}"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image]
    )
    
    flash[:success] = "Product has been successfully edited!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:success] = "Product has been successfully deleted!"
    redirect_to '/products'
  end
end
