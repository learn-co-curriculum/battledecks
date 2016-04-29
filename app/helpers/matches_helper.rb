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

  def render_voting(match, player_number)
    if match.ready? && match.can_user_vote?(current_user)
      link_to "Vote", tournament_match_votes_path(match.tournament, match, :player_id => player_id(match, player_number)), 
              :class => "btn btn-primary btn-block", 
              :method => :post 
    end
  end
end
