FactoryBot.define do
  factory :item do
    name                   { 'ブック' }
    description            { '300ページ' }
    category_id            { 2 }
    price                  { 2000 }
    condition_id           { 2 }
    shipping_fee_burden_id { 2 }
    shipment_source_id     { 2 }
    day_to_ship_id         { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/book.png'), filename: 'book.png')
    end    
  end
end
