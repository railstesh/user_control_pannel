class CreateRevenues < ActiveRecord::Migration[6.1]
  def change
    create_table :revenues do |t|
      t.integer :total_order
      t.decimal :total_revenue
      t.belongs_to :product

      t.timestamps
    end
  end
end
