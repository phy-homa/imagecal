class ImageMonth < ApplicationRecord
  belongs_to :calendar
  def self.save(calendar)
    ImageMonth.create!( month: calendar.month1_id, img: calendar.img1, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month2_id, img: calendar.img2, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month3_id, img: calendar.img3, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month4_id, img: calendar.img4, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month5_id, img: calendar.img5, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month6_id, img: calendar.img6, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month7_id, img: calendar.img7, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month8_id, img: calendar.img8, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month9_id, img: calendar.img9, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month10_id, img: calendar.img10, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month11_id, img: calendar.img11, calendar_id: calendar.id)
    ImageMonth.create!( month: calendar.month12_id, img: calendar.img12, calendar_id: calendar.id)
  end
end
