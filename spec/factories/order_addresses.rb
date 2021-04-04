FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipment_source_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    phone_number { '11111111111' }
    building_name { '東京ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
