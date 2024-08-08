FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyText" }
    phone_number { "MyString" }
    job { "MyString" }
    date_of_birth { "2024-07-24" }
  end
end
