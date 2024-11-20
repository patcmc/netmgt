# frozen_string_literal: true

FactoryBot.define do
  factory :user_contact do
    association :user
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    tags { Faker::Lorem.words(number: 3) }
  end
end
