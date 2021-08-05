class CreateImageOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :image_orders do |t|
      t.references :image, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
