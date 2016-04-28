class Vote < ActiveRecord::Base
  belongs_to :match
  belongs_to :voter, :class_name => "User"
  belongs_to :player, :class_name => "User"

  def self.player(player)
    where(:player => player)
  end
  
  def self.voter(voter)
    where(:voter => voter)
  end
end
