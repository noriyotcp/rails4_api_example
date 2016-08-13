FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "ユーザー#{n}"
    end
    addr1 "東京都"
    sequence :addr2 do |n|
      "千代田区"
    end

    trait :saitama do
      addr1 "埼玉県"
      addr2 "さいたま市"
    end
  end
end
