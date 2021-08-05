class OrderMailing
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture_id, :city, :building, :tel, :user_id

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user_id, presence: true

  def save
    order = Order.create( user_id: user_id)
    Mailing.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, tel: tel, order_id: order.id)
    binding.pry
  end
end