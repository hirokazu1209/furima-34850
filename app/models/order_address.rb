class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :city, :house_number, :phone_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, house_number: house_number, phone_number: phone_number, building_name: building_name)
  end
end