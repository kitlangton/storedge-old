# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price "99.95"
    company
    folder
    description { Faker::Lorem.paragraph }
  end
end
