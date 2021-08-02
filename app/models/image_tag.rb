class ImageTag

  include ActiveModel::Model 
  attr_accessor :comment, :picture, :season_id, :name, :user_id

  with_options presence: true do
    validates :picture
    validates :user_id
  end
  validates :season_id, numericality:{ other_than: 1, message: "can't be blank"}

  def save
    image = Image.create(comment: comment, picture: picture, season_id: season_id, user_id: user_id )
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    
    ImageTagRelation.create(image_id: image.id, tag_id: tag.id)
  end
end