class Product < ActiveRecord::Base
  def sale_message
    if price.to_i < 2
      @message = "Clearance Item!"
    else
      @message = "On Sale!"
    end
  end

  def tax
    @sales_tax = price.to_i * 0.09
  end

  def total
    @sales_tax = price.to_i * 1.09
  end
end
