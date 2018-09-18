class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  # validates :description, length: { in: 20..200 }
  validates :description, length: { minimum: 20 }
  validates :description, length: { maximum: 200 }


  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  # validates :price, numericality: true # ,redundant becasue of the line above 

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :carted_products
  has_many :orders, through: :carted_products
  # has_many :users, through: :carted_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end


  def is_discounted?
    price < 4
  end

  def tax
    price * 0.09
  end 

  def total
    price + tax
  end

end
