FactoryGirl.define do
  factory :deck do
    user
    sequence(:name){|n| "Deck #{n}"}
    sequence(:url){|n| "https://docs.google.com/presentation/d/presentation_id_#{n}/edit?usp=sharing" }
  end
end
