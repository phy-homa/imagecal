class Order < ApplicationRecord
  belongs_to :user
  belongs_to :image
  belongs_to :mailing
end
