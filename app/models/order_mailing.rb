class OrderMailing
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :image_id, :token

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create( user_id: user_id)
    mailing = Mailing.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
    @order_id = mailing.order_id
  end

  def get_id
    return @order_id
  end
end