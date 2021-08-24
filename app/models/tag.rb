class Tag < ApplicationRecord

  validates :name, uniqueness: true

  has_many :image_tag_relations
  has_many :images, through: :image_tag_relations
  
  def self.search(search)
    if search != ""
      tags = Tag.where(name: search)
      if tags[0].nil?
        return 
      else
        tags[0].images
      end
    else
      Image.all
    end
  end

end
