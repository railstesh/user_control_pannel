class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.decimal :shipping_amount
      t.string :shipping_method
      t.date :region_date
      t.belongs_to :order

      t.timestamps
    end
  end
end
