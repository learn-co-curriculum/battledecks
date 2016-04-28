class BracketGenerator
  attr_reader :tournament, :rounds

  def initialize(tournament)
    @tournament = tournament
    @players = tournament.players
    @rounds = {}
    (1..number_of_rounds).each do |round_number|
      matches_in_round = (@players.size/round_number/2)
      @rounds[round_number] = {}
      matches_in_round.times do |match_number|
        place_holder_letter = ("A".."Z").to_a[match_number-1]
        @rounds[round_number][place_holder_letter] = nil
      end
    end
  end

  def generate_matches(round = 1)
    # case round
    # when 1
      # {3=>10, 4=>9, 5=>8, 6=>7}
      rounds[round.to_i].each do |player_1_id, player_2_id|
        # How to get 2 unique decks for each player
        player_1_deck, player_2_deck = Deck.random(2)

        Match.create(
          :player_1_id => player_1_id, 
          :player_2_id => player_2_id, 
          :tournament => @tournament, 
          :round => round, 
          :player_1_deck => player_1_deck,
          :player_2_deck => player_2_deck
        )
      end      
    # end
  end

  def generate_round(round = 1)
    case round.to_i
    when 1
      @rounds[round.to_i] = initial_round_pairings(@tournament.player_ids).to_h
    else
      @rounds[round.to_i] = round_pairings(@tournament.winner_ids_for_round(round.to_i-1)).to_h
    end
  end

  def number_of_rounds
    @number_of_rounds ||= Math.log(@players.size, 2)
  end

  private
    def initial_round_pairings(player_ids)
      0.upto((player_ids.size/2)-1).collect do |i|
        [player_ids[i], player_ids[player_ids.size-i-1]]
      end
    end

    def round_pairings(player_ids)
      player_ids.each_slice(2).to_a
    end
end


# NOTES:
# players [1,2,3,4] # even number of players but divided by 2 is even

# {
#   1 => {1 => 4, 2 => 3}
# }

# players [1,2,3,4,5,6] # even number of players, but divided by 2 is odd.

# 4, 8, 16, 32
# 2  4   8  16


# {
#   1 => {1 => 6, 2 => 5, 3 => 4}
          # 1       2       3
#   2 => {1 => 2, 3 => 2, 1 => 3} - every player plays each other
          # 1       2       3 # - in the event of not being able to generate a final round, replay
#   3 => {1 => 2, 3 => 2, 1 => 3} - every player plays each other
          # 1       3       3
#   4 => {1 => 3}
# }

# players [1,2,3,4,5,6] # even number of players, but divided by 2 is odd.

# {
#   1 => {1 => 6, 2 => 5, 3 => 4}
          # 1       2       3
#   2 => {1 => 2, 3 => 2, 1 => 3} - every player plays each other
          # 1       3       3
#   4 => {1 => 3}
# }

# players [1,2,3,4,5,6,7,8,9,10]
#
# {
#   1 => {1 => 10, 2 => 9, 3 => 8, 4 => 7, 5 => 6},
#
#   [1,2,3,4,5]
#
#   [1,2], [1,3] [1,4], [1,5]
#   [2,3], [2,4],[2,5]
#   [3,4]  [3,5]
#   [4,5]
#
#   2 => {1 => 2, 3 => 4,}
# }

