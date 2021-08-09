class Order < ApplicationRecord
  belongs_to :user
  has_many :image_orders
  has_many :images, through: :image_orders
  has_one :mailing
end
