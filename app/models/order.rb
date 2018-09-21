class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal(cart)
    subtotal = 0
    cart.each do |
  end

end
