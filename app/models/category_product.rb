class CategoryProduct < ApplicationRecord
  belongs_to :category_products
  belongs_to :product
end
