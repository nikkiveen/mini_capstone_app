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
end
