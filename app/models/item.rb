class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :shipment_source
  belongs_to :day_to_ship

  with_options presence: true do
    validates :name
    validates :description
    validates :price, inclusion: {in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/}
  end

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_burden_id
    validates :shipment_source_id
    validates :day_to_ship_id
  end
  validates :price, numericality: true
end