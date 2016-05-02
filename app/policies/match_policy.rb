class MatchPolicy
  def initialize(user, match)
    @user = user
    @match = match
  end

  def upload_presentation?
    @match.current_player(@user)
  end

end