class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :user

  validates :status, inclusion: { in: ["Carted", "Purchased", "Removed"] }

  def count
    CartedProduct.where(status: 'Carted').count
  end
end