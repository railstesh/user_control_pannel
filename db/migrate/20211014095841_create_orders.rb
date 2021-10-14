class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_id, null: false
      t.string :ref_order_no
      t.date :purchase_date
      t.integer :status
      t.string :coupon_code
      t.belongs_to :product
      t.belongs_to :customer

      t.timestamps
    end
  end
end
