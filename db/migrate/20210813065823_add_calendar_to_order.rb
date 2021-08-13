class AddCalendarToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :calendar, null: false, foreign_key: true
  end
end
