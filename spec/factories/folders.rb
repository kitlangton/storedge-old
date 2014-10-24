# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :folder do
    name { Faker::Commerce.department }
    company
  end
end
