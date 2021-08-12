class ImageCalendar < ApplicationRecord
  belongs_to :image
  belongs_to :calendar

  def self.save(calendar,images)
    images.each do |image|
      ImageCalendar.create!(
        image_id: image.id, calendar_id: calendar.id
      )
    end
  end
end
