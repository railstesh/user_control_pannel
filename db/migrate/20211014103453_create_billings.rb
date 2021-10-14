class CreateBillings < ActiveRecord::Migration[6.1]
  def change
    create_table :billings do |t|
      t.integer :qty
      t.string :currency
      t.decimal :item_base_price
      t.decimal :item_price
      t.decimal :sub_total
      t.decimal :discount_amount
      t.decimal :tax_amount
      t.decimal :grand_total
      t.string :payment_method
      t.belongs_to :order

      t.timestamps
    end
  end
end
