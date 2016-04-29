decks
   name      url    user_id

users
   name    email

votes
  match_id     voter_id     player_id
    1              7            1

matches
  player_1_id  player_1_deck_id  player_2_id  player_2_deck_id   winner_id round tournament_id
      1             1               2               2               1         1         1
      3             3               4               4               4         1         1
      1             5               4               6               4         2         1

tournaments
  name           commissioner_id
  May tourney        6

tournament_players
  tournament_id    player_id
        1             1
        1             2
        1             3
        1             4

0. Add a deck
1. Register a user
2. Create a tournament
3. Add players to the tournament
4. Generate the bracket
  https://en.wikipedia.org/wiki/Round-robin_tournament


  12 players
  Round 1: 6 matches (12 players, 6 winners)
  Round 2: 3 matches (6 players, 3 winners)
  Round 3: 3 matches (a vs b, a vs c, b vs c)
  Round 4: 1 match (2 players, 1 winner)

  Assign decks so that no player ever uses or sees the same deck and no deck they've added.

  Bracket.new object non-ar.

5. Show bracket
6. Start a match.
7. Vote on Match
  1 vote per user per match.
8. Calculate winner and who advances
9. Start next match round when ready
10. Final match.
11. Declare winner

/decks
  resource to add decks to DB open to any user, no browsing decks once added, only owner can see the decks they've added.
  - basic crud
  - authorization
  - complex show view
/tournaments/new
  make a new tournament, add players
  - nested forms
  - validation
/tournaments/1/bracket/new
  - logical resources
  - service object
  - algorithm

  generate a bracket, preview it, save it to create it and define the tournament.
  - complex validation

/tournaments/1/rounds/1
  - see the matches in round 1 of tournament, start them, etc.
  - scopes
  - eager loading
/tournaments/1/matches/1
  - see a particular match, presentations, etc.
  - end the match, final voting
/tournaments/1/matches/1/votes
  - cast your vote
  - nested resource
  - complex validation
/tournaments/1
  - see the rounds, the current rounds, the matches, the brackets
  - the winner
  - admin on tournament
  - scopes
  - eager loading
  - complex views with lots of states
/stats
  Reports
    Fan favorite - overall most votes per tourney in ratio to games played?
    Most active voters
    Closest games
    Most popular match
    Most popular tournament
    Global rankings
    Best / work decks by votes


/players/1/tournaments
  Player tournament view
  Players can't see audience view of a tourney they are in
  - scopes
  - authorization

Views:
http://stackoverflow.com/questions/19099583/bracket-display-with-twitter-bootstrap
https://wrapbootstrap.com/theme/inspinia-responsive-admin-theme-WB0R5L90S
http://startbootstrap.com/template-overviews/sb-admin-2/
https://github.com/dreamingechoes/bootstrap_sb_admin_base_v2


https://github.com/comfy/active_link_to


Deck URLS
  BattleDeck 1 https://docs.google.com/presentation/d/1NAoKEKHCjtp7zSLNFRYzVCtoXwD8SexLKiUSFBGyuJg/edit?usp=sharing
<iframe src="https://docs.google.com/presentation/d/1NAoKEKHCjtp7zSLNFRYzVCtoXwD8SexLKiUSFBGyuJg/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

Sprint 1: Configuring Our application

Sprint 2: Decks to Users
  - Lock down uploading decks to authenticated users - done
  - Associate the deck with the users - done

Sprint 3: Clean Up
  - devise flash messages working. - done
  - clean up some of the asset pipeline stuff - done
  - TODO: Figure out why flash message in devise isn't being set after failed registration.

  Navigation
  Tournament model
  Tournament player
  Tournament new

  Tournament.player_ids_to_add=
  addplayerbyid

  Validations of adding players

  Decks choice? - two step process vs 1 form?

  Edit tournament / start / generate bracket

  Player.available_for_tournament - add a player after a tourney has started?

  Tournaments
    Upcoming
    Managing?
    New
  Decks
  Stats

  On hp - logged in
  - upcoming tournaments
  - your decks
  - your stats
  - current matches

  On hp - not logged in
    - recent matches
    - about
    - register / login

  Deck generator?
  
How do we know if a match is ready to start? - What's that even mean.
  - Both players upload their presentations for that deck/round (youtube URL)
  - Commissioner approves and hits start match?

-> When a match is started, viewers can vote for winners.
  - Is there a timelimit for voting or is it up to the commissioner to start/end a match?

On the match show page, if you are logged in as the player in the match  
  and then the ability to upload a youtube URL of your presentation
  you should see the deck you have to use
    - in theory, for an online event, to prevent people from rehearsing the deck, we should show them their deck and force them to upload within 10 minutes or something...


We have the ability for the players to upload their presentations

Once both players have uploaded their presentations, allow users to vote on the presentations

- clean up / remove as much devise code not being used as possible.
