FactoryGirl.define do
  factory :tournament do 
    sequence(:name) { |n| "Tournament #{n}" }
    commissioner

    factory :active_tournament do
      transient do
        player_size 2
      end

      before(:create) do |tournament, evaluator|
        evaluator.player_size.times do |i|
          tournament.add_player(create(:player))
        end
      end

      after(:create) do |tournament, evaluator|
        evaluator.player_size.times do 
          create(:deck)
        end
        BracketGenerator.new(tournament).generate
      end
    end
  end
end
