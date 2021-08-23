class OrderMailing
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :image_id, :token, :calendar_id

  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :tel, format: { with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :calendar_id
    validates :token
  end

  def save
    order = Order.create( user_id: user_id, calendar_id: calendar_id)
    mailing = Mailing.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
    @order_id = mailing.order_id
  end

  def get_id
    return @order_id
  end
end