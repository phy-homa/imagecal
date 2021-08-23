class ImageTag

  include ActiveModel::Model 
  attr_accessor :comment, :picture, :season_id, :user_id, :name

  with_options presence: true do
    validates :picture
    validates :user_id
  end
  validates :season_id, numericality:{ other_than: 1, message: "を選択してください"}


  def save
    image = Image.create(comment: comment, picture: picture, season_id: season_id, user_id: user_id )
    @image_id = image.id
  end

  def tags_save(tag_list)
    tag_list.each do |tag|

      tag = Tag.where(name: tag).first_or_initialize
      tag.save
    ImageTagRelation.create(image_id: @image_id, tag_id: tag.id)
    end
  end
end