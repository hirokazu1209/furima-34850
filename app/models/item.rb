class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :shipment_source
  belongs_to :day_to_ship

  validates :category_id           , numericality: { other_than: 1}
  validates :condition_id          , numericality: { other_than: 1}
  validates :shipping_fee_burden_id, numericality: { other_than: 1}
  validates :shipment_source_id    , numericality: { other_than: 1}
  validates :day_to_ship_id        , numericality: { other_than: 1}

end