FactoryGirl.define do
  factory :user do
    sequence(:name) { generate :sequence_name }
    email { generate :email }
  end
end
