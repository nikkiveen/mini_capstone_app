class Product < ActiveRecord::Base
  def sale_message
    if price.to_i < 40
      @message = "Clearance Item!"
    else
      @message = "On Sale!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def random
    total_product_count = Product.count
    random_id = rand(total_product_count)
  end
end
