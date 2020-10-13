FactoryBot.define do
  sequence :name do |n|
    "name#{n}"
  end

  factory :publisher do
    name
  end
end
