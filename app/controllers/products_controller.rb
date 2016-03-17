class ProductsController < ApplicationController
  def index
    @all_products = Product.all
    
    sort_by = params[:sort]
    sort_order = params[:sort_order]
    if sort_by
      @all_products = Product.order(sort_by => sort_order)
    end

    discount = params[:discount]
    if discount
      @all_products = Product.where("price < ?", 40)
    end
    
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
