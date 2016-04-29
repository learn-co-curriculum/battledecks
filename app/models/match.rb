class Match < ActiveRecord::Base
  belongs_to :player_1, :class_name => "User"
  belongs_to :player_2, :class_name => "User"
  belongs_to :player_1_deck, :class_name => "Deck"
  belongs_to :player_2_deck, :class_name => "Deck"
  belongs_to :winner, :class_name => "User"
  belongs_to :tournament

  has_many :votes

  def vote_for(player_id, voter)
    if has_vote_by?(voter)
      votes.voter(voter).destroy_all
    end

    votes.create(:voter => voter, :player_id => player_id)
  end

  def submit_presentation(player, match_params)
    update(match_params)
  end
  
  def presentation_uploaded?(player_number)
    send("#{player_number}_presentation_url").present?
  end

  def current_player(player)
    if player_1?(player)
      :player_1 
    elsif player_2?(player)
      :player_2
    end
  end

  def player_1?(player)
    player_1 == player
  end

  def player_2?(player)
    player_2 == player
  end

  def update_status(status)
    send("#{status}!")
  end

  def winner_is?(player)
    winner == player
  end

  def start!
    raise "Implement me!".inspect
  end
  
  def end!
    declare_winner
  end

  def over?
    winner.present?
  end

  def declare_winner
    update(:winner => current_winner)
  end

  def current_winner
    player_1_votes_count > player_2_votes_count ? player_1 : player_2
  end

  def has_vote_by?(voter)
    votes.voter(voter).exists?
  end
  
  def self.round(round = 1)
    where(:round => round)
  end

  def self.ended
    where.not(:winner => nil)
  end

  def self.active
    where(:winner => nil)
  end

  def player_1_votes_count
    votes.player(player_1).size
  end 

  def player_2_votes_count
    votes.player(player_2).size
  end
end
