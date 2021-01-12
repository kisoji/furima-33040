class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    # validates :token
    validates :post_code
    validates :city
    validates :house_number
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
 
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    SendingDestination.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end