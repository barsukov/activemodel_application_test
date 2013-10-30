FactoryGirl.define do
  factory :message do
    trait :bad_request_message do
      page 2
      pub0 "capmpaign"
      uid 'player1'
    end
    trait :empty_offers_request do
      page 1
      pub0 "capmpaign"
      uid 'player1'
    end
    factory :bad_message ,traits: [:bad_request_message]
    factory :good_message ,traits: [:empty_offers_request]
  end
end