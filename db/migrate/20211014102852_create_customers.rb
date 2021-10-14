class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.string :name, null: false
      t.string :email, null: false
      t.string :group

      t.timestamps
    end
  end
end
