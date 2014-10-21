FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "johndoe@gmail.com"
    password "123123123"
    password_confirmation "123123123"
    admin false

    factory :admin do
      first_name "Admin"
      last_name  "User"
      admin      true
    end
  end

end
