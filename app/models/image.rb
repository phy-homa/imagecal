class Image < ApplicationRecord


  has_one_attached :picture

  belongs_to :user
  has_many :image_tag_relations
  has_many :tags, through: :image_tag_relations, dependent: :destroy
  has_many :line_items
  has_many :carts, through: :line_items, dependent: :destroy
  has_many :image_calendars
  has_many :calendars, through: :image_calendars

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :season

  def self.show_jan

    @images_jan = Image.where(season_id: 2 )
  end

  def self.show_feb
    @images_feb = Image.where(season_id: 3 )
  end

  def self.show_mar
    @images_mar = Image.where(season_id: 4 )
  end

  def self.show_apr
    @images_apr = Image.where(season_id: 5 )
  end

  def self.show_may
    @images_may = Image.where(season_id: 6 )
  end

  def self.show_jun
    @images_jun = Image.where(season_id: 7 )
  end

  def self.show_jul
    @images_jul = Image.where(season_id: 8 )
  end

  def self.show_aug
    @images_aug = Image.where(season_id: 9 )
  end

  def self.show_sep
    @images_sep = Image.where(season_id: 10 )
  end

  def self.show_oct
    @images_oct = Image.where(season_id:11)
  end

  def self.show_nov
    @images_nov = Image.where(season_id: 12 )
  end

  def self.show_dec
    @images_dec = Image.where(season_id: 13)
  end
  
  def self.show_spr

    @images_spr = Image.where(season_id: 14 )
  end

  def self.show_sum
    @images_sum = Image.where(season_id: 15 )
  end

  def self.show_aut
    @images_aut = Image.where(season_id: 16 )
  end

  def self.show_win
    @images_win = Image.where(season_id: 17 )
  end

  def self.show_all
    @images_all = Image.where(season_id: 18 )
  end

  def self.show_etc
    @images_etc = Image.where(season_id: 19 )
  end
end
