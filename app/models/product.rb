class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :order
  
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
