def load_users!
  @u1 = User.find_by(:email => "player_1@battledecks.com")
  @u2 = User.find_by(:email => "player_2@battledecks.com")
  @u3 = User.find_by(:email => "player_3@battledecks.com")
  @u4 = User.find_by(:email => "player_4@battledecks.com")
  @u5 = User.find_by(:email => "player_5@battledecks.com")
  @u6 = User.find_by(:email => "player_6@battledecks.com")
  @u7 = User.find_by(:email => "player_7@battledecks.com")
  @u8 = User.find_by(:email => "player_8@battledecks.com")
  @u9 = User.find_by(:email => "player_9@battledecks.com")
  @u10 = User.find_by(:email => "player_10@battledecks.com")
  @u11 = User.find_by(:email => "player_11@battledecks.com")
  @u12 = User.find_by(:email => "player_12@battledecks.com")
  @u13 = User.find_by(:email => "player_13@battledecks.com")
end

namespace :seed do
  desc 'Generate 13 Starting Users'
  task :users => :environment do
    u1 = User.create(:email => "player_1@battledecks.com", :password => "testtest")
    u2 = User.create(:email => "player_2@battledecks.com", :password => "testtest")
    u3 = User.create(:email => "player_3@battledecks.com", :password => "testtest")
    u4 = User.create(:email => "player_4@battledecks.com", :password => "testtest")
    u5 = User.create(:email => "player_5@battledecks.com", :password => "testtest")
    u6 = User.create(:email => "player_6@battledecks.com", :password => "testtest")
    u7 = User.create(:email => "player_7@battledecks.com", :password => "testtest")
    u8 = User.create(:email => "player_8@battledecks.com", :password => "testtest")
    u9 = User.create(:email => "player_9@battledecks.com", :password => "testtest")
    u10 = User.create(:email => "player_10@battledecks.com", :password => "testtest")
    u11 = User.create(:email => "player_11@battledecks.com", :password => "testtest")
    u12 = User.create(:email => "player_12@battledecks.com", :password => "testtest")
    u13 = User.create(:email => "player_13@battledecks.com", :password => "testtest")
  end

  desc 'Generate 64 Decks'
  task :decks => :environment do
    64.times do |i|
      Deck.create(:user => User.first, 
                  :url => "https://docs.google.com/presentation/d/1NAoKEKHCjtp7zSLNFRYzVCtoXwD8SexLKiUSFBGyuJg/edit?usp=sharing", 
                  :name => "Deck #{i}"
      )
    end
  end
end
