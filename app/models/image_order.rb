class ImageOrder < ApplicationRecord
  belongs_to :image
  belongs_to :order
  belongs_to :cart
  belongs_to :calendar

  def self.create_images(order, line_items)

    line_items.each do |line_item|
      ImageOrder.create!( 
        image_id: line_item.image_id, cart_id: line_item.cart_id, order_id: order
      )
    end
  end
end
