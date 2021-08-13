class Image < ApplicationRecord


  has_one_attached :picture

  belongs_to :user
  has_many :image_orders
  has_many :orders, through: :image_orders, dependent: :destroy
  has_many :image_tag_relations
  has_many :tags, through: :image_tag_relations, dependent: :destroy
  has_many :line_items
  has_many :carts, through: :line_items, dependent: :destroy
  has_many :image_calendars
  has_many :calendars, through: :image_calendars



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :season
end
