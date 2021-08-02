class Tag < ApplicationRecord

  validates :name, uniqueness: true

  has_many :image_tag_relations
  has_many :images, through: :image_tag_relations
end
