class ImagesTag

  include ActiveModel::Model 
  attr_accessor :comment, :picture, :name, :user_id

  with_options presence: true do
    validates :picture
    validates :name
  end
  

  def save
    image = Image.create(comment: comment, picture: picture, user_id: user_id)
    tag = Tag.create(name: name)

    ImageTagRelation.create(image_id: image.id, tag_id: tag.id)
  end
end