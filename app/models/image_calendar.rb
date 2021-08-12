class ImageCalendar < ApplicationRecord
  belongs_to :image
  belongs_to :calendar

  def self.save(calendar)
    ImageCalendar.create(
      image_id: calendar.image_id, calendar_id: calendar.id
    )
  end
end
