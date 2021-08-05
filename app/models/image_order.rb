class ImageOrder < ApplicationRecord
  belongs_to :image
  belongs_to :order
end
