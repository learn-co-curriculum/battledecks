FactoryGirl.define do
  sequence :player_email do |n|
    "player_#{n}@battledecks.com"
  end
  sequence :user_email do |n|
    "user_#{n}@battledecks.com"
  end
end

FactoryGirl.define do
  factory :user, :aliases => [:commissioner] do
    password "testtest"
    email {generate(:user_email)}

    factory :player, class: User do
      email {generate(:player_email)}
    end  
  end
end
