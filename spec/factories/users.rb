FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    company
    email "johndoe@coloredge.com"
    password "123123123"
    password_confirmation "123123123"
    admin false

    factory :admin do
      first_name "Admin"
      last_name  "User"
      email "admin@coloredge.com"
      admin      true
    end
  end

end
