class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :comment
      t.integer :season_id, null: false
      t.timestamps
    end
  end
end
