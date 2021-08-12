class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.integer :month1_id, null: false
      t.integer :img1, null: false
      t.integer :month2_id, null: false
      t.integer :img2, null: false
      t.integer :month3_id, null: false
      t.integer :img3, null: false
      t.integer :month4_id, null: false
      t.integer :img4, null: false
      t.integer :month5_id, null: false
      t.integer :img5, null: false
      t.integer :month6_id, null: false
      t.integer :img6, null: false
      t.integer :month7_id, null: false
      t.integer :img7, null: false
      t.integer :month8_id, null: false
      t.integer :img8, null: false
      t.integer :month9_id, null: false
      t.integer :img9, null: false
      t.integer :month10_id, null: false
      t.integer :img10, null: false
      t.integer :month11_id, null: false
      t.integer :img11, null: false
      t.integer :month12_id, null: false
      t.integer :img12, null: false
      t.timestamps
    end
  end
end
