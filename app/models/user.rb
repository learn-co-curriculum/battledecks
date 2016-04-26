class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :decks
  has_many :managed_tournaments, :class_name => "Tournament", :foreign_key => :commissioner_id

  has_many :tournament_players, :foreign_key => :player_id
  has_many :played_tournaments, :through => :tournament_players, :class_name => "Tournament", :source => :tournament

end
