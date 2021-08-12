class CreateImageCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :image_calendars do |t|
      t.references :image, null: false
      t.references :calendar, null: false
      t.timestamps
    end
  end
end
