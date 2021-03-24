FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    first_name            { '太朗' }
    last_name             { '山田' }
    first_name_reading    { 'タロウ' }
    last_name_reading     { 'ヤマダ' }
    birthday              { '2000-01-01' }
  end
end
