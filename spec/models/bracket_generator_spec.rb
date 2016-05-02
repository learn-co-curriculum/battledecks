require 'rails_helper'

RSpec.describe BracketGenerator do
  describe '#initial_round_pairings' do
    let(:bracket){BracketGenerator.new(create(:active_tournament))}
    it 'generates the correct pairings for 4,6,8,12,36' do
      expect(bracket.initial_round_pairings((1..4).to_a)).to eq([[1, 4], [2, 3]])
      expect(bracket.initial_round_pairings((1..6).to_a)).to eq([[1, 6], [2, 5], [3, 4]])
      expect(bracket.initial_round_pairings((1..8).to_a)).to eq([[1, 8], [2, 7], [3, 6], [4, 5]])
      expect(bracket.initial_round_pairings((1..12).to_a)).to eq([[1, 12], [2, 11], [3, 10], [4, 9], [5, 8], [6, 7]])
      expect(bracket.initial_round_pairings((1..24).to_a)).to eq([[1, 24], [2, 23], [3, 22], [4, 21], [5, 20], [6, 19], [7, 18], [8, 17], [9, 16], [10, 15], [11, 14], [12, 13]])
    end
  end

  let!(:u1){create(:player)}
  let!(:u2){create(:player)}
  let!(:u3){create(:player)}
  let!(:u4){create(:player)}

  let!(:two_round_tournament){
    build(:tournament) do |t|
      t.add_player(u1)
      t.add_player(u2)
      t.add_player(u3)
      t.add_player(u4)
      t.save
    end
  }

  it 'takes in a tournament as an argument' do
    expect{BracketGenerator.new(two_round_tournament)}.to_not raise_error
  end

  it 'can return the tournament it is generating for' do
    bracket = BracketGenerator.new(two_round_tournament)
    expect(bracket.tournament).to eq(two_round_tournament)
  end

  it 'can generate a bracket for round 1' do
    bracket = BracketGenerator.new(two_round_tournament)
    bracket.generate_round(1)
    
    # Player 1 vs Player 4
    expect(bracket.rounds[1].keys[0]).to eq(u1.id)
    expect(bracket.rounds[1].values[0]).to eq(u4.id)
    
    # Player 2 vs Player 3
    expect(bracket.rounds[1].keys[1]).to eq(u2.id)
    expect(bracket.rounds[1].values[1]).to eq(u3.id)
  end
end
