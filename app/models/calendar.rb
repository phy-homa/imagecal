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

  with_options numericality: {other_than:1} do
    validates :month1_id
    validates :month2_id
    validates :month3_id
    validates :month4_id
    validates :month5_id
    validates :month6_id
    validates :month7_id
    validates :month8_id
    validates :month9_id
    validates :month10_id
    validates :month11_id
    validates :month12_id
  end

  with_options presence: true do
    validates :img1
    validates :img2
    validates :img3
    validates :img4
    validates :img5
    validates :img6
    validates :img7
    validates :img8
    validates :img9
    validates :img10
    validates :img11
    validates :img12
  end


end
