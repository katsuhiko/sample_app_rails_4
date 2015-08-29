FactoryGirl.define do
  # @see https://github.com/ffaker/ffaker/blob/master/REFERENCE.md
  sequence(:sequence_name) { |n| "#{n.to_s}.#{FFaker::Internet.user_name}" }
  sequence(:sequence_url) { |n| "#{FFaker::Internet.http_url}/#{n.to_s}" }

  sequence(:name) { FFaker::Internet.user_name }
  sequence(:url) { FFaker::Internet.http_url }
  sequence(:email) { FFaker::Internet.email }
  sequence(:password) { FFaker::Internet.password }
end
