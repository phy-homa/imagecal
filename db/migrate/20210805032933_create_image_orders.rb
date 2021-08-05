class CreateImageOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :image_orders do |t|
      t.references :image, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
