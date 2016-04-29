module MatchesHelper
  def player_header(match, player_number)
    match.send(player_number).email
  end

  def player_vote_count(match, player_number)
    match.send("#{player_number}_votes_count")
  end

  def player_id(match, player_number)
    match.send(player_number).id
  end
end
