class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :user

  def count
    CartedProduct.where(status: 'Carted').count
  end
end