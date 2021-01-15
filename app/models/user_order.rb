class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id,
                :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input correctly' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    SendingDestination.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                               building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
