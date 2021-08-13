class CreateImageMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :image_months do |t|
      t.integer :month, null: false
      t.integer :img, null: false
      t.references :calendar,null: false, foreign_key: true
      t.timestamps
    end
  end
end
