class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    @all_products = Product.all
    
    sort_by = params[:sort]
    sort_order = params[:sort_order]
    if sort_by && sort_order
      @all_products = Product.order(sort_by => sort_order)
    end

    discount = params[:discount]
    if discount
      @all_products = Product.where("price < ?", 40)
    end

    random = params[:random]
    if random
      redirect_to '/products/#{product.random_id}'
    end

    if params[:category]
      @all_products = Category.find_by(name: params[:category]).products
    end

    render 'index.html.erb'
  end

  def new
    @product = Product.new
    @image = Image.new
    @suppliers = Supplier.all
    render 'new.html.erb'
  end

  def create
    @suppliers = Supplier.all
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier][:supplier_id],
      user_id: current_user.id
    )

    if @product.save
      @image = Image.new(
        src: params[:src],
        product_id: @product.id
      )
      if @image.save
        flash[:success] = "Product has been successfully created!" 
        redirect_to "/products/#{@product.id}"
      else
        render "new.html.erb"
      end
    else
      render "new.html.erb"
    end
  end

  def show
    if params[:id] == "random"
      product = Product.all
      @product = product.sample
    else
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
    end

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
    
    if @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price].to_d
    )
      flash[:success] = "Product has been successfully edited!"
      redirect_to "/products/#{@product.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:success] = "Product has been successfully deleted!"
    redirect_to '/products'
  end

  def run_search
    search_term = params[:search]
    @all_products = Product.where("name LIKE ?", "%" + search_term + "%")
    render 'index.html.erb'
  end

  private

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to '/'
    end
  end
end
