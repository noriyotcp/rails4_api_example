FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User#{n}"
    end
    addr1 "Tokyo"
    sequence :addr2 do |n|
      "0-0-#{n}"
    end

    trait :saitama do
      addr1 "Saitama"
    end
  end
end
