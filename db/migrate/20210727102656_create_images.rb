class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :comment
      t.references :user
      t.timestamps
    end
  end
end
