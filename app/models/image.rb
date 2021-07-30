class Image < ApplicationRecord

validates :picture, presence: true

belongs_to :user
has_one_attached :picture
end
