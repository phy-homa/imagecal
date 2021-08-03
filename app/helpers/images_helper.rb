module ImagesHelper
  def current_favorite?(product, favorite)
    favorite.check_items.map{|i|i.image_id}.include?(image.id)
  end
end
