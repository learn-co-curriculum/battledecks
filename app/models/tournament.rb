# class PlayersValidator < ActiveModel::EachValidator
#   def validate(tournament, attribute, value)
#     # Validate the Quantity
#     if tournament.tournament_players.size < 3
#       tournament.errors[:players] << "Need at least 2 players in a tournament"
#     end
#   end
# end

class Tournament < ActiveRecord::Base
  attr_reader :player_ids_to_add

  belongs_to :commissioner, :class_name => "User"
  has_many :tournament_players
  has_many :players, :through => :tournament_players, :class_name => "User"

  validates :name, :presence => true
  # validates_with PlayerValidator
  # validate :players_validation

  has_many :matches

  def commissioner?(user)
    user == commissioner
  end

  def round_complete?(round)
    # if all the matches in the round have a winner
    # SELECT 1 FROM matches WHERE round = 1 AND winner IS NOT NILL
    matches.active.empty?
  end

  def has_rounds?
    matches.exists?
  end

  def winner_ids_for_round(round = 1)
    matches.round(round).collect{|m| m.winner_id}
  end

  def rounds
    # TODO: Try to get SQL grouping to work.
    matches.group_by{|m| m.round}
  end

  # TODO: Possibly Deprecate
  def has_round?(round = 1)
    matches.round(round).exists?
  end

  def self.upcoming
    all
  end

  def self.finished
    (1..5).to_a
  end

  def add_player(player)
    tournament_players.build(:player => player)
  end

  def available_players
    supperssion_ids = [commissioner.id] + self.player_ids
    User.where.not(:id => supperssion_ids.compact)
  end

  def player_ids_to_add=(player_ids)
    @player_ids_to_add = player_ids
    User.where(:id => player_ids).each{|player| add_player(player)}
    @player_ids_to_add
  end

  private
    def players_validation
      if self.tournament_players.size < 2
        self.errors[:player_ids_to_add] << "at least 2 players needed"
      end
    end
end
