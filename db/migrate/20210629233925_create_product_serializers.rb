class CreateProductSerializers < ActiveRecord::Migration[6.1]
  def change
    create_table :product_serializers do |t|

      t.timestamps
    end
  end
end
