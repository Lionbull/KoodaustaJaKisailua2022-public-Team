# Created by MustacheCorp at 07/12/2021
Feature: MustacheCorp poker hand checker hand comparison function joker inclusion
  As a casual player
  I want the hand checker to support joker cards
  So I can use it for casual table poker with a deck containing two jokers

  # If a hand has no repeated cards, one joker, and cannot form a straight or a flush even with a joker the joker should
  # be paired with the highest card of the hand

  Scenario: Pair with joker wins high card
    When I play the hand J H10 C8 C7 C5
    And my opponent plays the hand C13 D10 D12 C7 H6
    Then my hand wins

  Scenario: High card loses to pair with joker
    When I play the hand C9 D4 H11 C5 C1
    And my opponent plays the hand H1 C13 J D11 H9
    Then my hand loses

  Scenario: Lower pair with joker loses to higher pair without joker
    When I play the hand H4 D7 H10 C2 J
    And my opponent plays the hand C1 D1 H6 C5 D2
    Then my hand loses

  Scenario: Higher pair wins lower pair with joker
    When I play the hand H12 D12 C8 C9 D7
    And my opponent plays the hand C11 D6 D3 J S7
    Then my hand wins

  Scenario: Higher pair with joker wins lower pair
    When I play the hand D7 H13 C2 H8 J
    And my opponent plays the hand H3 C12 S12 D5 H6
    Then my hand wins

  Scenario: Lower pair loses to higher pair with joker
    When I play the hand H7 D4 C7 S5 C1
    And my opponent plays the hand J D1 H8 C9 S4
    Then my hand loses

  Scenario: Lower pair with joker loses to higher pair with joker
    When I play the hand S8 D2 C10 H4 J
    And my opponent plays the hand C11 J D9 H3 D2
    Then my hand loses

  Scenario: Higher pair with joker wins lower pair with joker
    When I play the hand J H12 D1 C9 H3
    And my opponent plays the hand C13 D2 J H9 C8
    Then my hand wins

  Scenario: Pair with joker and higher high card wins equal pair with lower high card
    When I play the hand J C10 D7 H6 C2
    And my opponent plays the hand H10 C6 S10 H5 D3
    Then my hand wins

  Scenario: Pair with lower high card loses to equal pair with joker and higher high card
    When I play the hand H6 C12 D4 H12 C8
    And my opponent plays the hand S12 H11 D2 C7 J
    Then my hand loses

  Scenario: Pair with higher high card wins equal pair with joker and lower high card
    When I play the hand C13 D8 H9 C9 H11
    And my opponent plays the hand S4 H7 J D9 C2
    Then my hand wins

  Scenario: Pair with joker and lower high card loses to equal pair with higher high card
    When I play the hand C11 D8 C4 H12 J
    And my opponent plays the hand C5 H12 C12 H1 H4
    Then my hand loses

  Scenario: Pair with joker and lower high card loses to equal pair with joker and higher high card
    When I play the hand H9 D11 C6 J H4
    And my opponent plays the hand H11 C10 H8 J C2
    Then my hand loses

  Scenario: Pair with joker and higher high card wins equal pair with joker and lower high card
    When I play the hand H9 C8 D5 J H11
    And my opponent plays the hand J H3 C11 D8 C6
    Then my hand wins

  Scenario: Pair with joker loses to two pairs
    When I play the hand S2 D8 H10 J C7
    And my opponent plays the hand H9 D13 C13 S5 H5
    Then my hand loses

  Scenario: Two pairs wins pair with joker
    When I play the hand D10 C6 H6 C10 H8
    And my opponent plays the hand C11 H8 C9 D2 J
    Then my hand wins

  # It is impossible two have two pairs with a joker, as it would always be more beneficial to use the joker to turn
  # one of the pairs into a three of a kind.

  # If the hand has a pair and one joker, the joker should be used to turn that pair into a three of a kind. If a hand
  # has no repeated cards, two jokers, and the jokers cannot be used to construct a straight or a flush the jokers
  # should be combined with the highest card to form a three of a kind

  Scenario: Three of a kind with joker wins two pairs
    When I play the hand S11 D13 D4 S13 J
    And my opponent plays the hand H11 C5 D3 S5 S3
    Then my hand wins

  Scenario: Two pairs loses to three of a kind with joker
    When I play the hand H9 D2 C10 S10 H2
    And my opponent plays the hand S12 D1 J H1 C9
    Then my hand loses

  Scenario: Three of a kind with two jokers wins two pairs
    When I play the hand C9 J D2 H13 J
    And my opponent plays the hand H9 D2 H10 C10 S9
    Then my hand wins

  Scenario: Two pairs loses to three of a kind with two jokers
    When I play the hand H6 C12 D12 D9 S9
    And my opponent plays the hand J D9 H1 C8 J
    Then my hand loses

  Scenario: Higher three of a kind with joker wins lower three of a kind
    When I play the hand C2 D10 H9 C10 J
    And my opponent plays the hand C8 H8 S13 D11 S8
    Then my hand wins

  Scenario: Lower three of a kind loses to higher three of a kind with joker
    When I play the hand H10 S3 D3 H3 C9
    And my opponent plays the hand J S8 D3 H9 S9
    Then my hand loses

  Scenario: Lower three of a kind with joker loses to higher three of a kind
    When I play the hand S8 J D3 C10 H3
    And my opponent plays the hand C7 S7 H10 D13 S7
    Then my hand loses

  Scenario: Higher three of a kind wins lower three of a kind with joker
    When I play the hand D1 H10 J C1 H9
    And my opponent plays the hand C12 H13 S8 D13 S13
    Then my hand wins

  Scenario: Lower three of a kind with joker loses to higher three of a kind with joker
    When I play the hand D9 S3 D3 J H11
    And my opponent plays the hand S9 H9 D3 H4 J
    Then my hand loses

  Scenario: Higher three of a kind with joker wins lower three of a kind with joker
    When I play the hand C5 J H10 S10 D9
    And my opponent plays the hand J C8 D9 H8 C2
    Then my hand wins

  Scenario: Higher three of a kind with two jokers wins lower three of a kind
    When I play the hand J H8 D10 C4 J
    And my opponent plays the hand H9 D3 C9 S9 C11
    Then my hand wins

  Scenario: Lower three of a kind loses to higher three of a kind with two jokers
    When I play the hand C3 D12 H13 C12 S12
    And my opponent plays the hand J J H1 D5 C10
    Then my hand loses

  Scenario: Higher three of a kind wins lower three of a kind with two jokers
    When I play the hand C10 H8 D8 S8 C6
    And my opponent plays the hand H6 J C2 C7 J
    Then my hand wins

  Scenario: Lower three of a kind with two jokers loses to higher three of a kind
    When I play the hand J H4 C8 J D9
    And my opponent plays the hand H10 D11 C11 S11 H3
    Then my hand loses

  Scenario: Three of a kind with joker and higher high card wins equal three of a kind with joker and lower high card
    When I play the hand H8 C10 D8 H10 J
    And my opponent plays the hand D10 H5 C3 J S10
    Then my hand wins

  Scenario: Three of a kind with joker and lower high card loses to equal three of a kind with joker and higher high card
    When I play the hand J C1 D8 H1 H11
    And my opponent plays the hand H10 C13 J S1 C1
    Then my hand loses

  Scenario: Three of a kind with two jokers and higher high card wins equal three of a kind with lower high card
    When I play the hand J J H10 C7 D12
    And my opponent plays the hand C12 H8 C4 H12 S12
    Then my hand wins

  Scenario: Three of a kind with two jokers and lower high card loses to equal three of a kind with higher high card
    When I play the hand H1 J C3 J D7
    And my opponent plays the hand C11 D1 S1 C1 C13
    Then my hand loses

  Scenario: Three of a kind with higher high card wins equal three of a kind with two jokers and lower high card
    When I play the hand C9 D11 H9 S9 H4
    And my opponent plays the hand D7 J H4 D9 J
    Then my hand wins

  Scenario: Three of a kind with two jokers and lower high card loses to equal three of a kind with higher high card
    When I play the hand J C2 H5 H10 J
    And my opponent plays the hand H4 C10 S8 D10 S10
    Then my hand loses

  Scenario: Three of a kind with lower high card loses to equal three of a kind with two jokers and higher high card
    When I play the hand H12 C8 D3 D12 C12
    And my opponent plays the hand J S12 H11 J C4
    Then my hand loses

  Scenario: Three of a kind with two jokers and higher high card wins equal three of a kind with lower high card
    When I play the hand H12 J J C1 D8
    And my opponent plays the hand C6 S12 H10 C12 D12
    Then my hand wins

  Scenario: Three of a kind with joker loses to straight
    When I play the hand H7 D10 S3 H10 J
    And my opponent plays the hand S8 D5 H7 H6 D4
    Then my hand loses

  Scenario: Straight wins three of a kind with joker
    When I play the hand D11 H10 H9 H8 C7
    And my opponent plays the hand J S8 D3 C8 H4
    Then my hand wins

  Scenario: Three of a kind with two jokers loses to straight
    When I play the hand H8 J D2 C11 J
    And my opponent plays the hand H6 S8 C7 D5 S9
    Then my hand loses

  Scenario: Straight wins three of a kind with two jokers
    When I play the hand S12 D11 H13 C10 C9
    And my opponent plays the hand H3 D5 J J C1
    Then my hand wins

  # If the hand has four cards that are sequential, or that form a straight with a gap, and a joker, the hand should be
  # considered a straight, When the cards are not all from the same suite. Similarly if the hand has three cards
  # that are sequential, or that form a straight with two gaps, and two jokers, the hand should also be considered a
  # straight When the cards are not all from the same suite.

  Scenario: Straight with a joker wins three of a kind
    When I play the hand S6 J H8 C9 D10
    And my opponent plays the hand H10 C10 S10 D1 H12
    Then my hand wins

  Scenario: Three of a kind loses to straight with a joker
    When I play the hand C8 D3 H7 C7 D7
    And my opponent plays the hand J S11 C12 D13 H10
    Then my hand loses

  Scenario: Straight with a joker wins three of a kind with joker
    When I play the hand C8 D9 J H10 H11
    And my opponent plays the hand S8 D3 H3 J H13
    Then my hand wins

  Scenario: Three of a kind with joker loses to straight with joker
    When I play the hand J H11 D9 S11 H4
    And my opponent plays the hand H3 H5 H6 H7 J
    Then my hand loses

  Scenario: Straight with two jokers wins three of a kind
    When I play the hand H5 J H8 C9 J D4
    And my opponent plays the hand D11 H12 C11 H11 C2
    Then my hand wins

  Scenario: Three of a kind loses to straight with two jokers
    When I play the hand H13 D13 C13 H8 D6
    And my opponent plays the hand H2 C3 D4 J J
    Then my hand loses

  Scenario: Three of a kind loses to high straight with joker
    When I play the hand H3 D5 C5 H8 S5
    And my opponent plays the hand H11 S12 J D13 H1
    Then my hand loses

  Scenario: High straight with joker wins three of a kind
    When I play the hand H11 D12 C13 S1 J
    And my opponent plays the hand C1 D1 H1 H13 D11
    Then my hand wins
    
  Scenario: High straight with joker wins three of a kind with joker
    When I play the hand S13 D1 S12 H11 J
    And my opponent plays the hand J H12 C12 D9 H4
    Then my hand wins
    
  Scenario: Three of a kind with joker loses to high straight with joker
    When I play the hand H10 S3 D8 J H8
    And my opponent plays the hand C11 D1 H12 H13 J
    Then my hand loses

  Scenario: Low straight with joker wins three of a kind
    When I play the hand H1 J C3 D4 H5
    And my opponent plays the hand H9 D4 C9 S9 C7
    Then my hand wins

  Scenario: Three of a kind loses to low straight with joker
    When I play the hand C8 C3 D10 C10 S10
    And my opponent plays the hand S1 C3 D2 J H4
    Then my hand loses

  Scenario: Low straight with joker wins three of a kind with joker
    When I play the hand H3 J S1 D4 C2
    And my opponent plays the hand C8 D10 J H3 S8
    Then my hand wins

  Scenario: Three of a kind with joker loses to low straight with joker
    When I play the hand J H8 D8 C10 D1
    And my opponent plays the hand H1 D2 C3 J H5
    Then my hand loses

  Scenario: High straight with two sequential jokers wins three of a kind
    When I play the hand J J H12 S1 D13
    And my opponent plays the hand D10 H8 C10 S10 H4
    Then my hand wins

  Scenario: Three of a kind loses to high straight with two sequential jokers
    When I play the hand C5 D8 H8 S8 H10
    And my opponent plays the hand H12 D13 C1 J J
    Then my hand loses

  Scenario: Low straight with two sequential jokers wins three of a kind
    When I play the hand J H1 J C4 D5
    And my opponent plays the hand S8 D10 H10 C1 S10
    Then my hand wins

  Scenario: Three of a kind wins low straight with two sequential jokers
    When I play the hand H9 D9 S10 H1 C9
    And my opponent plays the hand S1 D5 J J S3
    Then my hand loses

  Scenario: Straight with joker and higher highest card wins straight with lower highest card
    When I play the hand H8 C7 J H6 H5
    And my opponent plays the hand H4 S8 C5 D6 S7
    Then my hand wins

  Scenario: Straight with lower highest card loses to straight with joker and higher highest card
    When I play the hand S5 C2 H4 H1 D3
    And my opponent plays the hand J D2 H3 C5 H4
    Then my hand loses

  Scenario: Straight with higher highest card wins straight with joker and lower highest card
    When I play the hand H9 D10 H7 D11 C8
    And my opponent plays the hand H6 J C7 D9 H10
    Then my hand wins

  Scenario: Straight with joker and lower highest card loses to straight with higher highest card
    When I play the hand H8 D7 J C4 S5
    And my opponent plays the hand S9 D10 S8 C7 H6
    Then my hand loses

  Scenario: Straight with joker and higher highest card wins straight with joker and lower highest card
    When I play the hand J H12 D11 C13 S1
    And my opponent plays the hand H10 C9 D12 J H13
    Then my hand wins

  Scenario: Straight with joker and lower highest card loses to straight with joker and higher highest card
    When I play the hand H6 J H7 C4 D3
    And my opponent plays the hand D7 S6 S5 C4 J
    Then my hand loses

  Scenario: Straight with two jokers and higher highest card wins straight with lower highest card
    When I play the hand H5 D7 J C6 J
    And my opponent plays the hand C4 D5 H8 C7 S6
    Then my hand wins

  Scenario: Straight with lower highest card loses to straight with two jokers and higher highest card
    When I play the hand H9 D8 S10 S11 C12
    And my opponent plays the hand J C11 J S13 D121
    Then my hand loses

  Scenario: Straight with two jokers and lower highest card loses to straight with higher highest card
    When I play the hand S8 J J D9 H7
    And my opponent plays the hand D8 H10 C12 S11 S9
    Then my hand loses

  Scenario: Straight with higher highest card wins straight with two jokers and lower highest card
    When I play the hand S8 D7 S4 H6 C5
    And my opponent plays the hand D3 H5 J C6 J
    Then my hand wins

  Scenario: High straight with two sequential jokers wins straight with lower highest card
    When I play the hand C10 D11 J H12 J
    And my opponent plays the hand H9 D13 H12 D10 C11
    Then my hand wins

  Scenario: Straight with lower highest card loses to high straight with two jokers
    When I play the hand C10 D11 H9 H13 S12
    And my opponent plays the hand J S12 D13 H1 J
    Then my hand loses

  Scenario: Straight with a joker loses to flush
    When I play the hand J S9 D10 S7 C6
    And my opponent plays the hand C5 C10 C2 C7 C13
    Then my hand loses

  Scenario: Flush wins straight with joker
    When I play the hand S9 S3 S4 S8 S12
    And my opponent plays the hand H9 J H8 D10 C6
    Then my hand wins

  Scenario: Flush wins straight with two jokers
    When I play the hand H9 H13 H11 H7 H6
    And my opponent plays the hand J H5 C6 J C9
    Then my hand wins

  Scenario: Straight with two jokers loses to flush
    When I play the hand H8 H10 J C11 J
    And my opponent plays the hand D5 D4 D12 D9 D6
    Then my hand loses

  # If a hand has only cards of one suite and jokers (one or two) and the cards don't form a straight with gaps that
  # can be filled by the jokers the hand should be considered a flush and the joker(s) should both be considered (an)
  # ace(s) And resolving situations where both players have a flush

  Scenario: Straight loses to flush with a joker
    When I play the hand H10 S8 D7 H9 S11
    And my opponent plays the hand S9 S2 S8 J S13
    Then my hand loses

  Scenario: Flush with a joker wins straight
    When I play the hand D4 D10 J D11 D2
    And my opponent plays the hand S8 D4 S7 C6 H5
    Then my hand wins

  Scenario: Straight with a joker loses to flush with a joker
    When I play the hand J S9 D11 C8 H7
    And my opponent plays the hand H8 H3 H13 H12 J
    Then my hand loses

  Scenario: Flush with a joker wins straight with a joker
    When I play the hand D9 J D2 D1 D11
    And my opponent plays the hand H8 J D4 D6 C5
    Then my hand wins

  Scenario: Straight loses to flush with two jokers
    When I play the hand C1 D13 H12 H10 S11
    And my opponent plays the hand C8 J J C2 C13
    Then my hand loses

  Scenario: Flush with two jokers wins straight
    When I play the hand H9 J H13 H6 J
    And my opponent plays the hand C4 C5 D1 D3 H2
    Then my hand wins

  Scenario: Flush with joker wins flush with no ace
    When I play the hand D9 J D8 D3 D11
    And my opponent plays the hand S13 S3 S8 S6 S11
    Then my hand wins

  Scenario: Flush with no ace wins flush with joker
    When I play the hand S11 S13 S10 S8 S4
    And my opponent plays the hand H9 J H10 H4 H2
    Then my hand loses

  Scenario: Flush with ace and higher second highest card wins flush with joker and lower second highest card
    When I play the hand D1 D8 D12 D6 D4
    And my opponent plays the hand J C11 C9 C8 C6
    Then my hand wins

  Scenario: Flush with joker and lower second highest card loses to flush with ace and higher second highest card
    When I play the hand D12 J D11 D8 D3
    And my opponent plays the hand H1 H13 H9 H3 H2
    Then my hand loses

  Scenario: Flush with joker and lower second highest card loses to flush with joker and higher second highest card
    When I play the hand H13 J H10 H8 H5
    And my opponent plays the hand D1 D11 D9 D8 J
    Then my hand loses

  Scenario: Flush with joker and higher second highest card wins flush with joker and lower second highest card
    When I play the hand H12 H10 J H8 H2
    And my opponent plays the hand D9 J D2 D10 D6
    Then my hand wins

  Scenario: Flush with two jokers wins flush with no jokers
    When I play the hand S9 J J S3 S10
    And my opponent plays the hand H13 H1 H12 H11 H9
    Then my hand wins

  Scenario: Flush with no jokers loses to flush with two jokers
    When I play the hand D1 D11 D12 D13 D5
    And my opponent plays the hand J S9 S4 S2 J
    Then my hand loses

  Scenario: Flush with a joker loses to full house
    When I play the hand C9 J C12 C4 C7
    And my opponent plays the hand H10 C8 D8 S10 D10
    Then my hand loses

  Scenario: Full house wins flush with joker
    When I play the hand D1 H1 C9 S9 S1
    And my opponent plays the hand S9 S4 S13 J S11
    Then my hand wins

  Scenario: Flush with two jokers loses to full house
    When I play the hand D10 J D3 J D11
    And my opponent plays the hand H9 C8 S9 D9 D8
    Then my hand loses

  Scenario: Full house wins flush with two jokers
    When I play the hand S11 D6 H6 S6 D11
    And my opponent plays the hand J S9 J S2 S13
    Then my hand wins

  # If a hand has two pairs and a joker it should be considered a full house with the joker added to the higher pair
  # to form threes

  Scenario: Full house with joker wins flush
    When I play the hand H10 S10 J D9 C9
    And my opponent plays the hand D11 D1 D12 D8 D5
    Then my hand wins

  Scenario: Flush loses to full house with joker
    When I play the hand C8 C12 C3 C2 C1
    And my opponent plays the hand C11 J H7 D7 S11
    Then my hand loses

  Scenario: Full house with joker and higher threes wins full house with lower threes
    When I play the hand D7 C7 J H11 C11
    And my opponent plays the hand H10 C8 D8 C10 S8
    Then my hand wins

  Scenario: Full house with lower threes loses to full house with joker and higher threes
    When I play the hand S10 D12 C10 D10 H12
    And my opponent plays the hand C11 J H10 D10 S11
    Then my hand loses

  Scenario: Full house with lower threes but higher pair loses to full house with joker and higher threes
    When I play the hand S11 D1 C11 H1 D11
    And my opponent plays the hand J H12 D8 C8 S12
    Then my hand loses

  Scenario: Full house with joker and higher threes wins full house with lower threes but higher pair
    When I play the hand H6 D9 C6 S9 J
    And my opponent plays the hand S11 C11 D4 H4 C4
    Then my hand wins

  Scenario: Full house with joker and lower threes loses to full house with higher threes
    When I play the hand S2 S11 D2 J H11
    And my opponent plays the hand H9 D9 C12 D12 S12
    Then my hand loses

  Scenario: Full house with higher threes wins full house with joker and lower threes
    When I play the hand H11 S11 H8 D11 S8
    And my opponent plays the hand C9 J H3 S3 C9
    Then my hand wins

  Scenario: Full house with joker and higher threes wins full house with joker and lower threes
    When I play the hand J H8 D12 C12 C8
    And my opponent plays the hand D10 C9 H9 J C10
    Then my hand wins

  Scenario: Full house with joker and lower threes loses to full house with joker and higher threes
    When I play the hand C8 D8 S4 J H4
    And my opponent plays the hand S11 H3 J S3 D11
    Then my hand loses

  Scenario: Full house with joker and higher pair wins full house with joker equal threes and lower pair
    When I play the hand J S4 H8 D8 C4
    And my opponent plays the hand C8 J S2 D4 H2
    Then my hand wins

  Scenario: Full house with joker and lower pair loses to full house with joker equal threes and higher pair
    When I play the hand S10 H6 S6 J C10
    And my opponent plays the hand D8 J D10 H10 C8
    Then my hand loses

  Scenario: Full house with joker loses to four of a kind
    When I play the hand D11 C1 H1 S11 J
    And my opponent plays the hand D3 C5 C3 H3 S3
    Then my hand loses

  Scenario: Four of a kind wins full house with joker
    When I play the hand S9 D9 C9 S12 H9
    And my opponent plays the hand J H10 S4 D10 D4
    Then my hand wins

  # If a hand has three of a kind and a joker or a pair and two jokers it should be considered four of a kind
  # with the joker(s) added to the repeated card.

  Scenario: Four of a kind with joker wins full house
    When I play the hand J H5 D10 C5 S5
    And my opponent plays the hand C10 S10 H13 D13 S13
    Then my hand wins

  Scenario: Full house loses to four of a kind with joker
    When I play the hand S1 D8 C8 D1 S8
    And my opponent plays the hand J H10 C10 S10 H4
    Then my hand loses

  Scenario: Full house with joker loses to four of a kind with joker
    When I play the hand D1 J H8 C1 S8
    And my opponent plays the hand J S6 D10 H10 S10
    Then my hand loses

  Scenario: Four of a kind with joker wins full house with joker
    When I play the hand J H4 D4 S9 S4
    And my opponent plays the hand H8 J S8 D12 S12
    Then my hand wins

  Scenario: Full house loses to four of a kind with two jokers
    When I play the hand S1 D12 C12 C1 H1
    And my opponent plays the hand D4 J H9 C4 J
    Then my hand loses

  Scenario: Four of a kind with two jokers wins full house
    When I play the hand H8 D11 C11 J J
    And my opponent plays the hand C9 D12 C12 H12 H9
    Then my hand wins

  Scenario: Four of a kind with joker and higher fours wins four of a kind with lower fours
    When I play the hand J H4 D11 C11 S11
    And my opponent plays the hand C8 D6 H8 S8 D8
    Then my hand wins

  Scenario: Four of a kind with lower fours loses to four of a kind with joker and higher fours
    When I play the hand H4 D9 C4 S4 D4
    And my opponent plays the hand D8 S5 J D5 H5
    Then my hand loses

  Scenario: Four of a kind with higher fours wins four of a kind with joker and lower fours
    When I play the hand H11 D11 S4 S11 C11
    And my opponent plays the hand J H1 D8 C8 S8
    Then my hand wins

  Scenario: Four of a kind with joker and lower fours loses to four of a kind with higher fours
    When I play the hand S9 J D7 H7 S7
    And my opponent plays the hand H8 D8 C4 S8 C8
    Then my hand loses

  Scenario: Four of a kind with joker and higher fours wins four of a kind with joker and lower fours
    When I play the hand H11 D11 J S4 S11
    And my opponent plays the hand D9 S13 C9 D9 J
    Then my hand wins

  Scenario: Four of a kind with joker and lower fours loses to four of a kind with joker and higher fours
    When I play the hand H4 J H13 S4 D4
    And my opponent plays the hand C9 D3 J H9 S9
    Then my hand loses

  Scenario: Four of a kind with lower fours loses to four of a kind with two jokers and higher fours
    When I play the hand H9 D11 C9 D9 S9
    And my opponent plays the hand S10 J D1 J H10
    Then my hand loses

  Scenario: Four of a kind with two jokers and higher fours wins four of a kind with lower fours
    When I play the hand S10 D8 J J C10
    And my opponent plays the hand H9 C9 D9 C3 S9
    Then my hand wins

  Scenario: Four of a kind with joker loses to straight flush
    When I play the hand D9 J H3 S3 C3
    And my opponent plays the hand C8 C7 C9 C10 C6
    Then my hand loses

  Scenario: Straight flush wins four of a kind with joker
    When I play the hand H10 H11 H9 H7 H8
    And my opponent plays the hand J C10 D10 H4 S10
    Then my hand wins

  Scenario: Straight flush wins four of a kind with two jokers
    When I play the hand S10 S8 S6 S9 S7
    And my opponent plays the hand J H13 S1 D1 J
    Then my hand wins

  Scenario: Four of a kind with two jokers loses to straight flush
    When I play the hand J H10 C4 J C10
    And my opponent plays the hand D4 D8 D6 D7 D5
    Then my hand loses

  # If the hand has four cards that are sequential, or that form a straight with a gap, and a joker, or if the hand has
  # three cards that are sequential, or that form a straight with two gaps, and two jokers and all the cards are of the
  # same suite the hand should be considered a straight flush.

  Scenario: Straight flush with joker wins four of a kind
    When I play the hand H8 H10 J H11 H7
    And my opponent plays the hand D4 H13 S4 H4 C4
    Then my hand wins

  Scenario: Four of a kind loses to straight flush with joker
    When I play the hand H12 S12 D12 C12 S2
    And my opponent plays the hand D3 D5 J D4 D6
    Then my hand loses

  Scenario: Straight flush with joker wins four of a kind with joker
    When I play the hand J H8 H9 H12 H10
    And my opponent plays the hand H8 D3 D8 J C8
    Then my hand wins

  Scenario: Four of a kind with joker loses to straight flush with joker
    When I play the hand D3 H4 C4 J S4
    And my opponent plays the hand D5 D6 D8 D4 J
    Then my hand loses

  Scenario: Four of a kind loses to straight flush with two jokers
    When I play the hand H10 D4 D10 S10 C10
    And my opponent plays the hand J H9 H12 H13 J
    Then my hand loses

  Scenario: Straight flush with two jokers wins four of a kind
    When I play the hand J J S4 S6 S8
    And my opponent plays the hand H10 S5 D10 C10 S10
    Then my hand wins

  Scenario: High straight flush with joker wins four of a kind
    When I play the hand D11 D12 J D1 D13
    And my opponent plays the hand H2 S10 D10 H10 C10
    Then my hand wins

  Scenario: Four of a kind loses to high straight flush with joker
    When I play the hand C4 H13 D4 S4 H4
    And my opponent plays the hand D1 D12 D11 J D13
    Then my hand loses

  Scenario: Low straight flush with joker wins four of a kind
    When I play the hand C1 C2 C4 J C3
    And my opponent plays the hand H10 D8 C8 S8 H8
    Then my hand wins

  Scenario: Four of a kind loses to low straight flush with joker
    When I play the hand C13 D13 S13 S1 H13
    And my opponent plays the hand J H1 H2 H3 H4
    Then my hand loses

  Scenario: High straight flush with two jokers wins four of a kind
    When I play the hand D12 D1 J D13 J
    And my opponent plays the hand H6 C6 D5 D6 S6
    Then my hand wins

  Scenario: Four of a kind loses to high straight flush with two jokers
    When I play the hand D3 H12 C3 S3 H3
    And my opponent plays the hand C1 C13 C12 J J
    Then my hand loses

  Scenario: Four of a kind loses to low straight flush with two jokers
    When I play the hand D5 H5 C5 S5 H9
    And my opponent plays the hand D1 J D3 D4 J
    Then my hand loses

  Scenario: Low straight flush with two jokers wins four of a kind
    When I play the hand C4 C1 J C3 J
    And my opponent plays the hand D7 J S11 C7 H7
    Then my hand wins

  Scenario: Straight flush with joker and higher highest card wins straight flush with lower highest card
    When I play the hand D8 D7 J D9 D10
    And my opponent plays the hand H3 H5 H6 H2 H4
    Then my hand wins

  Scenario: Straight flush with lower highest card loses to straight flush with joker and higher highest card
    When I play the hand S8 S7 S6 S4 S5
    And my opponent plays the hand H8 H5 J H6 H7
    Then my hand loses

  Scenario: Straight flush with joker and lower highest card loses to straight flush with higher highest card
    When I play the hand D8 D7 J D4 D5
    And my opponent plays the hand S8 S9 S7 S5 S6
    Then my hand loses

  Scenario: Straight flush with higher highest card wins straight flush with joker and lower highest card
    When I play the hand C3 C4 C7 C5 C6
    And my opponent plays the hand S6 J S2 S4 S5
    Then my hand wins

  Scenario: Straight flush with joker and higher highest card wins straight flush with joker and lower highest card
    When I play the hand D8 D9 D11 D10 J
    And my opponent plays the hand J C10 C8 C9 C6
    Then my hand wins

  Scenario: Straight flush with joker and lower highest card loses to straight flush with joker and higher highest card
    When I play the hand D3 D7 J D4 D6
    And my opponent plays the hand J C8 C7 C9 C11
    Then my hand loses

  Scenario: Straight flush with two jokers and higher highest card wins straight flush with lower highest card
    When I play the hand J J D11 D10 D12
    And my opponent plays the hand S11 S10 S13 S12 S9
    Then my hand wins

  Scenario: Straight flush with lower highest card loses to straight flush with two joker and higher highest card
    When I play the hand S1 S2 S3 S4 S5
    And my opponent plays the hand H2 H3 J H4 J
    Then my hand loses

  Scenario: Straight flush with two jokers and lower highest card loses to straight flush with higher highest card
    When I play the hand D7 J D4 J D6
    And my opponent plays the hand S9 S10 S13 S12 S11
    Then my hand loses

  Scenario: Straight flush with higher highest card wins straight flush with two jokers and lower highest card
    When I play the hand J J S10 S11 S7
    And my opponent plays the hand D6 D10 D8 D9 D7
    Then my hand wins

  # If the hand has only three repeated numbers and two jokers or four repeated numbers and one joker it is
  # considered five of a kind. Five of a kind wins all other hands and if both players have five of a kind, the value
  # of the repeated card is considered

  Scenario: Five of a kind with joker wins straight flush
    When I play the hand J S10 D10 H10 C10
    And my opponent plays the hand H1 H12 H13 H10 H11
    Then my hand wins

  Scenario: Straight flush loses to five of a kind with joker
    When I play the hand D6 D8 D4 D5 D7
    And my opponent plays the hand C3 D3 S3 J H3
    Then my hand loses

  Scenario: Straight flush with joker loses to five of a kind with joker
    When I play the hand J D4 D7 D5 D8
    And my opponent plays the hand C10 D10 J S10 H10
    Then my hand loses

  Scenario: Five of a kind with joker wins straight flush with joker
    When I play the hand D1 H1 J C1 S1
    And my opponent plays the hand J S8 S6 S9 S5
    Then my hand wins

  Scenario: Five of a kind with two jokers wins straight flush
    When I play the hand H8 D8 S8 J J
    And my opponent plays the hand C8 C9 C10 C11 C12
    Then my hand wins

  Scenario: Straight flush loses to five of a kind with two jokers
    When I play the hand H5 H4 H3 H2 H1
    And my opponent plays the hand J H9 D9 J S9
    Then my hand loses

  Scenario: Higher five of a kind with joker wins lower five of a kind with joker
    When I play the hand H8 C8 D8 J S8
    And my opponent plays the hand H4 D4 C4 J S4
    Then my hand wins

  Scenario: Lower five of a kind with joker loses to higher five of a kind with joker
    When I play the hand S11 D11 H11 C11 J
    And my opponent plays the hand J D13 H13 C13 S13
    Then my hand loses

  Scenario: Five of a kind with joker and aces wins lower five of a kind with joker
    When I play the hand D1 H1 J C1 S1
    And my opponent plays the hand H13 J C13 D13 S13
    Then my hand wins

  Scenario: Lower five of a kind with joker loses to five of a kind with joker and aces
    When I play the hand S10 D10 C10 H10 J
    And my opponent plays the hand S1 J H1 D1 C1
    Then my hand loses