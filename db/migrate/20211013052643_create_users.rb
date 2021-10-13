class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :role, default: 0
      t.string :google_id, null: false

      t.timestamps
    end
  end
end
