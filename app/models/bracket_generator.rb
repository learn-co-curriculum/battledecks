

class BracketGenerator
  attr_reader :tournament, :rounds

  def initialize(tournament)
    @tournament = tournament
    @players = tournament.players
    @rounds = {}
    (1..(@players.size/2)).each do |round_number|
      matches_in_round = (@players.size/round_number/2)
      @rounds[round_number] = {}
      matches_in_round.times do |match_number|
        place_holder_letter = ("A".."Z").to_a[match_number-1]
        @rounds[round_number][place_holder_letter] = nil
      end
    end
  end

  def generate_round(round = 1)
    # players = @tournament.players
    # player_ids = @tournament.player_ids
    case round
    when 1
      # round_pairings(@tournament.player_ids)
      @rounds[round] = round_pairings(@tournament.player_ids).to_h
      # binding.pry
      # what i need to do is take the ids in the players
      # and do like a first plays last sort of outside-in thing
      # [1,2,3,4,5,6]
      # [[1,6], [2,5], [3,4]]
    end
  end


  # private
    def round_pairings(player_ids)
      # bracket pairing - what this method does is generate the pairing of opponents in a round
      0.upto((player_ids.size/2)-1).collect do |i|
        [player_ids[i], player_ids[player_ids.size-i-1]]
      end
    end
end



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
