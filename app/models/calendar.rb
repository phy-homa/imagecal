class Calendar < ApplicationRecord
  has_many :image_calendars
  has_many :images, through: :image_calendars
  has_one :order
  has_many :image_month

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :month1
  belongs_to :month2
  belongs_to :month3
  belongs_to :month4
  belongs_to :month5
  belongs_to :month6
  belongs_to :month7
  belongs_to :month8
  belongs_to :month9
  belongs_to :month10
  belongs_to :month11
  belongs_to :month12

  validates :month1_id, numericality: {other_than:1}
  validates :month2_id, numericality: {other_than:1}
  validates :month3_id, numericality: {other_than:1}
  validates :month4_id, numericality: {other_than:1}
  validates :month5_id, numericality: {other_than:1}
  validates :month6_id, numericality: {other_than:1}
  validates :month7_id, numericality: {other_than:1}
  validates :month8_id, numericality: {other_than:1}
  validates :month9_id, numericality: {other_than:1}
  validates :month10_id, numericality: {other_than:1}
  validates :month11_id, numericality: {other_than:1}
  validates :month12_id, numericality: {other_than:1}

end
