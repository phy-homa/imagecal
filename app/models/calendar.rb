class Calendar < ApplicationRecord
  has_many :image_calendars
  has_many :image, through: :calendar
  has_one :order
end
