class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :group
      t.references :address, index: true

      t.timestamps
    end
  end
end
