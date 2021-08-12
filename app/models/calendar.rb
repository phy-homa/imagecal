class Calendar < ApplicationRecord
  has_many :image_calendars
  has_many :images, through: :image_calendars
  has_one :order
end
