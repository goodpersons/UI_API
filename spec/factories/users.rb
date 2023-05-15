FactoryBot.define do
  factory :user do
    eamil { "MyString" }
    username { "MyString" }
    gender { 1 }
    phone { 1 }
    password_digest { "MyString" }
  end
end
