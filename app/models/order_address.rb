class OrderAddress
  include ActiveModel::Model
 
  attr_accessor :user_id, :order_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :order_id
    validates :item_id
    validates :city
    validates :block
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }, numericality: { only_integer: true }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, order_id: order_id)
  end
end