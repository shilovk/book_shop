FactoryBot.define do
  sequence :title do |n|
    "title#{n}"
  end

  factory :book do
    title
    publisher
  end
end
