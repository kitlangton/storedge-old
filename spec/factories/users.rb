FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email {Faker::Internet.email}
    password "123123123"
    password_confirmation "123123123"
    company
    admin false

    factory :admin do
      company nil
      first_name "Admin"
      last_name  "User"
      admin      true
    end

    factory :csr do
      first_name "CSR"
      last_name  "User"
      csr      true
    end
  end

end
