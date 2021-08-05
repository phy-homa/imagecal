class Image < ApplicationRecord


  has_one_attached :picture

  belongs_to :user
  has_many :orders, through: :image_orders
  has_many :image_orders
  has_many :tags, through: :image_tag_relations
  has_many :image_tag_relations
  has_many :carts, through: :line_items
  has_many :line_items


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :season
end
