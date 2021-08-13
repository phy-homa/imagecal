class Order < ApplicationRecord
  belongs_to :user
  has_one :mailing
  belongs_to :calendar
end
