class Image < ApplicationRecord


belongs_to :user
has_one_attached :picture
has_many :tags, through: :image_tag_relations
has_many :image_tag_relations
end
