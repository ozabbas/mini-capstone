class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  # is_discounted? => true/false
  # tax
  def tax
    return price * 0.09    
  end
  # total
  def total
    tax + price
  end

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end
end