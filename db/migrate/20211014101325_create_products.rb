class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_id, null: false
      t.string :name, null: false
      t.string :sku, null: false
      t.decimal :weight
      t.string :size

      t.timestamps
    end
  end
end
