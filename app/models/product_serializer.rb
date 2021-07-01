class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :tax, :description, :name, :is_discounted?, :inventory, :supplier, :images
end