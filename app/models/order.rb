class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :user

  validates :user_id, presence: true
  validates :subtotal, numericality: {greater_than: 0}

end
