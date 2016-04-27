require 'rails_helper'

RSpec.describe BracketGenerator do
  context '#round_pairings' do
    let(:bracket){BracketGenerator.new(Object.new)}
    it 'generates the correct pairings for 4,6,8,12,36' do
      expect(bracket.round_pairings((1..4).to_a)).to eq([[1, 4], [2, 3]])
      expect(bracket.round_pairings((1..6).to_a)).to eq([[1, 6], [2, 5], [3, 4]])
      expect(bracket.round_pairings((1..8).to_a)).to eq([[1, 8], [2, 7], [3, 6], [4, 5]])
      expect(bracket.round_pairings((1..12).to_a)).to eq([[1, 12], [2, 11], [3, 10], [4, 9], [5, 8], [6, 7]])
      expect(bracket.round_pairings((1..24).to_a)).to eq([[1, 24], [2, 23], [3, 22], [4, 21], [5, 20], [6, 19], [7, 18], [8, 17], [9, 16], [10, 15], [11, 14], [12, 13]])
    end
  end

  let!(:u1){User.create(:email => "player_1@battledecks.com", :password => "testtest")}
  let!(:u2){User.create(:email => "player_2@battledecks.com", :password => "testtest")}
  let!(:u3){User.create(:email => "player_3@battledecks.com", :password => "testtest")}
  let!(:u4){User.create(:email => "player_4@battledecks.com", :password => "testtest")}

  let!(:two_round_bracket){Tournament.create(:name => "Two Round Bracket")}
  before do
    TournamentPlayer.create(:tournament => two_round_bracket, :player => u1)
    TournamentPlayer.create(:tournament => two_round_bracket, :player => u2)
    TournamentPlayer.create(:tournament => two_round_bracket, :player => u3)
    TournamentPlayer.create(:tournament => two_round_bracket, :player => u4)
  end

  it 'takes in a tournament as an argument' do
    expect{BracketGenerator.new(two_round_bracket)}.to_not raise_error
  end

  it 'can return the tournament it is generating for' do
    bracket = BracketGenerator.new(two_round_bracket)
    expect(bracket.tournament).to eq(two_round_bracket)
  end

  it 'can generate a bracket for round 1' do
    bracket = BracketGenerator.new(two_round_bracket)

    round = bracket.generate_round
    expect(round[1].keys).to match_array([1,2])
    expect(round[1].values).to match_array([4,3])
  end
end
