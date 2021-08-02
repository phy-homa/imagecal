class Image < ApplicationRecord


belongs_to :user
has_one_attached :picture
has_many :image_tag_relations
has_many :tags, through: :image_tag_relations
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :season
end
