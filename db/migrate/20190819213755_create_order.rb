class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :customer_id
      t.timestamps
    end
    create_table :orders_product do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.timestamps
    end
  end
end
