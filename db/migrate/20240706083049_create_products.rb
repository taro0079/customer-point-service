class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_code
      t.integer :price
      t.string :product_name

      t.timestamps
    end
  end
end
