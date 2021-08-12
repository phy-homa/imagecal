class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.integer :month, null: false
      t.timestamps
    end
  end
end
