# Created by MustacheCorp at 03/12/2021
Feature: MustacheCorp poker hand checker hand comparison function simple cases
  As a tipsy party-goer
  I want to know which one of two poker hands is stronger
  In order to ease playing poker in the company christmas party



  # Rule: A hand with no repeated cards, flush or straight, the value of the hand is determined by high card
  #   Should the high card be equal the second highest card is examined and so forth.
  #   Ace is treated as 14 in these comparisons.

  Scenario: Higher high card wins
    When I play the hand C2 H5 S10 C3 D4
    And my opponent plays the hand H3 C8 D9 C7 S5
    Then my hand wins

  Scenario: Lower high card loses
    When I play the hand D11 H12 S8 D2 D9
    And my opponent plays the hand C13 H2 H4 H9 S3
    Then my hand loses

  Scenario: Same high card, lower second highest loses
    When I play the hand S11 D13 S9 S8 S7
    And my opponent plays the hand C12 S13 D8 C2 H11
    Then my hand loses

  Scenario: Same high card, higher second highest wins
    When I play the hand S8 S9 C6 H4 D3
    And my opponent plays the hand H9 C7 D5 S4 H3
    Then my hand wins

  Scenario: High card ace wins against king
    When I play the hand D1 S11 H4 D9 C2
    And my opponent plays the hand D13 H5 D12 C9 S3
    Then my hand wins

  Scenario: High card queen loses to high card ace
    When I play the hand S12 H4 H5 H9 H2
    And my opponent plays the hand C1 S11 H8 D3 C2
    Then my hand loses

  Scenario: High card hands with two highest card equal, higher third highest card wins
    When I play the hand H1 S13 D10 H8 S2
    And my opponent plays the hand D1 D13 H9 D3 S8
    Then my hand wins

  Scenario: High card hands with two highest card equal, lower third highest card loses
    When I play the hand D12 D2 S9 S13 C3
    And my opponent plays the hand C13 H12 S10 C7 H6
    Then my hand loses

  Scenario: High card hands with three highest card equal, lower fourth highest card loses
    When I play the hand H8 S10 S11 H6 H3
    And my opponent plays the hand D11 C10 C8 C7 C2
    Then my hand loses

  Scenario: High card hands with three highest card equal, higher fourth highest card wins
    When I play the hand D7 D13 S1 D5 H2
    And my opponent plays the hand C1 C13 H7 H4 S3
    Then my hand wins

  Scenario: High card hands with four highest cards equal, lower last card loses
    When I play the hand S10 D13 H1 S9 H6
    And my opponent plays the hand C1 H10 C13 D9 S8
    Then my hand loses

  Scenario: High card hands with four highest cards equal, higher last card wins
    When I play the hand C10 C9 C6 C8 H5
    And my opponent plays the hand S10 H9 D4 H8 S6
    Then my hand wins


  # Rule: Pair wins high card. And both players have a pair, the pair with higher value wins.
  #   If players have equal value pairs, the remaining cards are compared with high card rules.
  #   Ace is treated as 14 in these comparisons.

  Scenario: Pair wins highest card
    When I play the hand H5 D5 S2 C3 H4
    And my opponent plays the hand C13 H8 C2 D7 D2
    Then my hand wins

  Scenario: Highest card loses to pair
    When I play the hand S1 D13 H12 S11 S9
    And my opponent plays the hand C2 H2 S8 D9 S3
    Then my hand loses

  Scenario: Higher pair wins
    When I play the hand H11 S11 C3 H1 S5
    And my opponent plays the hand H10 D10 D8 D9 D7
    Then my hand wins

  Scenario: Lower pair loses
    When I play the hand D8 C8 H10 S11 S7
    And my opponent plays the hand C1 H1 S2 D3 C4
    Then my hand loses

  Scenario: Equal pairs higher highest remaining card wins
    When I play the hand H10 D10 D9 D8 D7
    And my opponent plays the hand S10 C10 H8 C6 S4
    Then my hand wins

  Scenario: Equal pairs lower highest remaining card loses
    When I play the hand C2 D2 H10 D8 C5
    And my opponent plays the hand H13 H2 C6 D5 S2
    Then my hand loses

  Scenario: Equal pairs and highest remaining cards, lower second highest remaining card loses
    When I play the hand H9 C9 S13 H6 C2
    And my opponent plays the hand C13 S9 H8 D2 D9
    Then my hand loses

  Scenario: Equal pairs and highest remaining cards, higher second highest remaining card wins
    When I play the hand D11 H11 C1 H12 D5
    And my opponent plays the hand S1 S11 C11 H10 C9
    Then my hand wins

  Scenario: Equal pairs and two highest remaining cards, lower lowest remaining card loses
    When I play the hand C3 H13 S11 H3 S5
    And my opponent plays the hand S13 D3 H9 S3 C11
    Then my hand loses

  Scenario: Equal pairs and two highest remaining cards, higher lowest remaining card wins
    When I play the hand S9 H1 C1 S13 D8
    And my opponent plays the hand S1 C13 D9 S3 D1
    Then my hand wins



  # Rule: Two pairs wins pair and high card. If both players have two pairs, higher pair value is examined first.
  #   If both players have equal higher pair, lower pair value is examined and after that, the remaining card value.
  #   Ace is treated as 14 in these comparisons.

  Scenario: Highest card loses to two pairs
    When I play the hand C1 D12 H11 C10 S9
    And my opponent plays the hand H8 S8 D5 S5 C2
    Then my hand loses

  Scenario: Two pairs wins highest card
    When I play the hand C11 H11 D2 S2 H3
    And my opponent plays the hand H2 D8 S9 C12 C3
    Then my hand wins

  Scenario: Pair loses to two pairs
    When I play the hand H1 S1 D9 S8 H7
    And my opponent plays the hand H2 D2 S9 H9 H13
    Then my hand loses

  Scenario: Two pairs wins a pair
    When I play the hand D10 C10 D12 C12 H1
    And my opponent plays the hand H13 C13 C4 C7 C10
    Then my hand wins

  Scenario: Two pairs, higher higher pair wins
    When I play the hand S3 C3 H12 S11 D11
    And my opponent plays the hand H8 D8 S10 D10 C1
    Then my hand wins

  Scenario: Two pairs, lower higher pair loses
    When I play the hand D9 C9 S7 H7 S2
    And my opponent plays the hand H13 S13 D11 H11 D6
    Then my hand loses

  Scenario: Two pairs, equal higher pair, higher lower pair wins
    When I play the hand S1 D1 H13 D13 C9
    And my opponent plays the hand H1 C1 S11 H11 C10
    Then my hand wins

  Scenario: Two pairs, equal higher pair, lower lower pair loses
    When I play the hand H10 D10 S13 D13 C1
    And my opponent plays the hand C11 D11 H13 C13 C9
    Then my hand loses

  Scenario: Two pairs, equal pairs, lower remaining card loses
    When I play the hand H9 C8 S9 H8 D3
    And my opponent plays the hand D8 S8 D9 C9 D5
    Then my hand loses

  Scenario: Two pairs, equal pairs, higher remaining card wins
    When I play the hand S13 D13 H8 S1 D8
    And my opponent plays the hand S8 D11 C8 C13 H13
    Then my hand wins


  # Rule: Three of a kind wins two pairs, pair and high card. If both players have three of a kind, higher card trio wins.
  #   Ace is treated as 14 in these comparisons.

  Scenario: High card loses to three of a kind
    When I play the hand D12 D6 D8 D9 H10
    And my opponent plays the hand H2 S2 D2 S8 H5
    Then my hand loses

  Scenario: Three of a kind wins high card
    When I play the hand S9 D9 H9 C3 D12
    And my opponent plays the hand S1 D9 H10 D8 C11
    Then my hand wins

  Scenario: Three of a kind wins a pair
    When I play the hand D6 H6 C6 H1 S3
    And my opponent plays the hand C1 D1 S9 H10 C3
    Then my hand wins

  Scenario: A pair loses to three of a kind
    When I play the hand C13 H13 C1 C9 S6
    And my opponent plays the hand H10 C10 D10 D11 S5
    Then my hand loses

  Scenario: Three of a kind wins two pairs
    When I play the hand D11 S11 H11 C9 H3
    And my opponent plays the hand D13 H13 D1 C1 D9
    Then my hand wins

  Scenario: Two pairs loses to three of a kind
    When I play the hand H8 S8 S10 H10 D13
    And my opponent plays the hand S1 H1 D1 C13 H11
    Then my hand loses

  Scenario: Lower three of a kind loses
    When I play the hand S4 H4 C4 D8 C2
    And my opponent plays the hand H7 D7 S7 H6 H2
    Then my hand loses

  Scenario: Higher three of a kind wins
    When I play the hand C11 H11 D11 H9 S4
    And my opponent plays the hand S1 H9 D9 S9 S6
    Then my hand wins


  # Rule: Straight wins three of a kind, two pairs, pair and high card.
  #   If both players have straights, the highest card of the straight is considered.
  #   Ace is treated as 1 or 14, whichever results in a straight.
  #   In a 1-5 straight, ace doesn't count as 14 if comparing highest card.

  Scenario: A straight wins high card
    When I play the hand C4 S5 H6 H7 S3
    And my opponent plays the hand C1 D13 D11 C10 C5
    Then my hand wins

  Scenario: High card loses to a straight
    When I play the hand C13 H10 D8 C6 H5
    And my opponent plays the hand C8 H12 D9 C10 S13
    Then my hand loses

  Scenario: A pair loses to a straight
    When I play the hand D10 H8 S6 D6 S7
    And my opponent plays the hand H4 S5 H3 D2 D6
    Then my hand loses

  Scenario: A straight wins a pair
    When I play the hand S6 H7 H8 D9 C5
    And my opponent plays the hand D10 H10 S1 H13 D4
    Then my hand wins

  Scenario: A straight wins two pairs
    When I play the hand C2 H5 D4 C6 S3
    And my opponent plays the hand D1 H1 C13 D13 H12
    Then my hand wins

  Scenario: Two pairs loses to a straight
    When I play the hand D8 C12 H8 C1 S12
    And my opponent plays the hand H5 C9 S8 D6 D7
    Then my hand loses

  Scenario: Three of a kind loses to a straight
    When I play the hand H1 D10 C8 H10 S10
    And my opponent plays the hand C12 H10 D9 C11 S13
    Then my hand loses

  Scenario: Straight wins three of a kind
    When I play the hand C5 D6 H7 C8 S9
    And my opponent plays the hand H11 D11 H13 C8 C11
    Then my hand wins

  Scenario: Both players have a straight, straight with the lower highest card loses
    When I play the hand H9 D10 D11 H8 D7
    And my opponent plays the hand S10 S9 C11 C12 S8
    Then my hand loses

  Scenario: Both players have a straight, straight with the higher highest card wins
    When I play the hand H9 D10 C8 D11 H12
    And my opponent plays the hand S4 S7 D5 C6 D8
    Then my hand wins

  Scenario: Low straight with an ace wins three of a kind
    When I play the hand S1 H3 S2 D4 D5
    And my opponent plays the hand C13 D13 H13 H12 H11
    Then my hand wins

  Scenario: Three of a kind loses to low straight with an ace
    When I play the hand D1 S1 H1 H13 D9
    And my opponent plays the hand C3 C2 C1 H4 H5
    Then my hand loses
  
  Scenario: Low straight with ace loses to higher straight
    When I play the hand H2 S1 H3 D4 D5
    And my opponent plays the hand D9 H7 S8 S10 H11
    Then my hand loses
  
  Scenario: Higher straight wins low straight with aces
    When I play the hand S2 D3 H4 D6 S5
    And my opponent plays the hand H1 H3 S4 C2 S5
    Then my hand wins

  Scenario: High straight with an ace wins three of a kind
    When I play the hand S1 H10 D13 D12 S11
    And my opponent plays the hand H13 S13 C13 S10 H9
    Then my hand wins

  Scenario: Three of a kind loses to high straight with an ace
    When I play the hand D10 S8 H11 C8 H8
    And my opponent plays the hand H12 C13 D1 H10 S11
    Then my hand loses

  Scenario: High straight with an ace wins against lower straight
    When I play the hand S11 C10 C12 D13 H1
    And my opponent plays the hand C13 H12 C11 D10 D9
    Then my hand wins

  Scenario: Lower straight loses to a high straight with an ace
    When I play the hand C4 C5 C6 C7 D8
    And my opponent plays the hand H11 D12 D13 H10 H1
    Then my hand loses


  # Rule: Flush wins straight, three of a kind, two pairs, pair and high card.
  #   If both players have flushes, the hands are compared based on high cards (see high card rules)

  Scenario: Flush wins high card
    When I play the hand S3 S8 S4 S11 S13
    And my opponent plays the hand D8 H1 S9 H2 C12
    Then my hand wins

  Scenario: High card loses to flush
    When I play the hand H10 C11 D12 D13 C5
    And my opponent plays the hand H9 H3 H11 H8 H5
    Then my hand loses

  Scenario: Flush wins pair
    When I play the hand C10 C11 C4 C9 C2
    And my opponent plays the hand H1 D9 C9 D11 D7
    Then my hand wins

  Scenario: Pair loses to flush
    When I play the hand H5 C6 D8 C1 S1
    And my opponent plays the hand S9 S10 S8 S12 S5
    Then my hand loses

  Scenario: Two pairs loses to flush
    When I play the hand C10 H6 S10 C12 D12
    And my opponent plays the hand S1 S6 S4 S12 S7
    Then my hand loses

  Scenario: Flush wins two pairs
    When I play the hand C2 C3 C11 C9 C5
    And my opponent plays the hand H11 S8 D8 C4 D11
    Then my hand wins

  Scenario: Three of a kind loses to flush
    When I play the hand D6 H6 C6 S8 H3
    And my opponent plays the hand D6 D11 D1 D3 D13
    Then my hand loses

  Scenario: Flush wins three of a kind
    When I play the hand C10 C7 C9 C1 C4
    And my opponent plays the hand C13 S13 H9 H4 D13
    Then my hand wins

  Scenario: Flush wins straight
    When I play the hand D6 D12 D3 D11 D8
    And my opponent plays the hand H4 D7 S6 H5 C8
    Then my hand wins

  Scenario: Straight loses to flush
    When I play the hand C1 H10 D13 S12 H11
    And my opponent plays the hand S10 S8 S9 S3 S2
    Then my hand loses

  Scenario: Both players have a flush, higher high card wins
    When I play the hand D8 D9 D4 D10 D11
    And my opponent plays the hand H7 H5 H3 H2 H10
    Then my hand wins

  Scenario: Both players have a flush, lower high card loses
    When I play the hand C10 C13 C11 C8 C4
    And my opponent plays the hand S12 S9 S7 S1 S4
    Then my hand loses


  # Rule: Full house wins flush, straight, three of a kind, two pairs, pair and high card
  #   If both players have three of a kind, the value of the tripled card is compared first and then the pair
  #   Ace is counted as 14.

  Scenario: Full house wins high card
    When I play the hand S10 H7 D7 H10 C10
    And my opponent plays the hand C1 D10 D5 D4 S9
    Then my hand wins

  Scenario: High card loses to full house
    When I play the hand S10 H8 D5 C12 H3
    And my opponent plays the hand S11 H11 D11 C13 H13
    Then my hand loses

  Scenario: Full house wins pair
    When I play the hand C3 H8 D3 C8 S8
    And my opponent plays the hand S10 H8 D10 C6 H12
    Then my hand wins

  Scenario: Pair loses to full house
    When I play the hand D5 H7 C12 S12 S13
    And my opponent plays the hand H1 D3 C3 S3 S1
    Then my hand loses

  Scenario: Full house wins two pairs
    When I play the hand H7 D11 C7 S7 S11
    And my opponent plays the hand H3 C13 C3 S12 D12
    Then my hand wins

  Scenario: Two pairs loses to full house
    When I play the hand S9 D9 H1 D4 S1
    And my opponent plays the hand H8 C8 C1 D1 D8
    Then my hand loses

  Scenario: Full house wins three of a kind
    When I play the hand S5 D5 H12 C12 C5
    And my opponent plays the hand S13 D8 C2 H13 C13
    Then my hand wins

  Scenario: Three of a kind loses to full house
    When I play the hand H10 D10 C10 S8 C7
    And my opponent plays the hand C9 D2 H2 H9 S2
    Then my hand loses

  Scenario: Straight loses to full house
    When I play the hand H9 D10 S11 S12 D13
    And my opponent plays the hand C8 D9 S9 C9 S8
    Then my hand loses

  Scenario: Full house wins straight
    When I play the hand S1 D1 H1 C10 H10
    And my opponent plays the hand C1 H3 D2 H4 H5
    Then my hand wins

  Scenario: Flush loses to full house
    When I play the hand H3 H5 H9 H1 H13
    And my opponent plays the hand S2 D2 H2 D12 C12
    Then my hand loses

  Scenario: Full house wins flush
    When I play the hand H11 D9 C9 C11 S11
    And my opponent plays the hand S1 S3 S9 S7 S6
    Then my hand wins

  Scenario: Both players have a full house, higher trio wins
    When I play the hand C3 D10 H10 D3 S10
    And my opponent plays the hand H1 D8 H8 S8 C1
    Then my hand wins

  Scenario: Both players have a full house, lower trio loses
    When I play the hand C11 D10 H11 S10 D11
    And my opponent plays the hand C1 H1 D1 S2 H2
    Then my hand loses

  # Rule: Four of a kind wins full house, flush, straight, three of a kind, two pairs, pair and high card
  #   If both players have four of a kind the higher quadrupled card wins
  #   Ace is counted as 14

  Scenario: High card loses to four of a kind
    When I play the hand H3 S9 D13 S10 S1
    And my opponent plays the hand H2 S2 C8 C2 D2
    Then my hand loses

  Scenario: Four of a kind wins high card
    When I play the hand H9 C7 D7 H7 S7
    And my opponent plays the hand S10 D11 H12 C13 C8
    Then my hand wins

  Scenario: Pair loses to four of a kind
    When I play the hand H4 S4 D9 C1 H10
    And my opponent plays the hand H3 D3 S3 C3 C2
    Then my hand loses

  Scenario: Four of a kind wins pair
    When I play the hand H1 D1 C1 S1 C10
    And my opponent plays the hand H13 D13 D11 D12 D10
    Then my hand wins

  Scenario: Two pairs loses to four of a kind
    When I play the hand C10 S8 C8 H10 H11
    And my opponent plays the hand S5 H5 C5 D12 D5
    Then my hand loses

  Scenario: Four of a kind wins two pairs
    When I play the hand S7 D9 H7 D7 C7
    And my opponent plays the hand H10 D10 S11 C12 D12
    Then my hand wins

  Scenario: Three of a kind loses to four of a kind
    When I play the hand H8 D9 S4 H4 D4
    And my opponent plays the hand H10 D12 D10 C10 S10
    Then my hand loses

  Scenario: Four of a kind wins three of a kind
    When I play the hand H9 D9 C9 C1 S9
    And my opponent plays the hand H1 D3 D1 S1 H4
    Then my hand wins

  Scenario: Four of a kind wins straight
    When I play the hand H8 D8 C10 S8 C8
    And my opponent plays the hand H9 S10 D13 S12 H11
    Then my hand wins

  Scenario: Straight loses to four of a kind
    When I play the hand H1 C2 D3 H5 C4
    And my opponent plays the hand H9 C9 S9 D10 D9
    Then my hand loses

  Scenario: Flush loses to four of a kind
    When I play the hand C9 C8 C10 C11 C13
    And my opponent plays the hand C12 H12 H3 S12 D12
    Then my hand loses

  Scenario: Four of a kind wins flush
    When I play the hand H4 C5 C4 D4 S4
    And my opponent plays the hand H10 H5 H6 H9 H8
    Then my hand wins

  Scenario: Four of a kind wins full house
    When I play the hand H6 C1 D6 C6 S6
    And my opponent plays the hand H1 D1 S13 D13 S1
    Then my hand wins

  Scenario: Full house loses to four of a kind
    When I play the hand H8 C5 D8 H5 S5
    And my opponent plays the hand H6 C6 S6 D6 S13
    Then my hand loses

  Scenario: Both player have four of a kind higher quadrupled card wins
    When I play the hand S8 D8 H8 C8 D13
    And my opponent plays the hand D3 S3 H3 C3 H11
    Then my hand wins

  Scenario: Both player have four of a kind lower quadrupled card loses
    When I play the hand H10 C10 D10 S8 S10
    And my opponent plays the hand H1 D1 C1 S1 H13
    Then my hand loses

  # Rule: Straight flush wins four of a kind, full house, flush, straight, three of a kind, two pairs, pair and high card
  #   If both players have straight flushes, the highest card of the straight is considered.
  #   Ace is treated as 1 or 14, whichever results in a straight.
  #   In a 1-5 straight, ace doesn't count as 14 if comparing highest card.

  Scenario: High card loses to straight flush
    When I play the hand D10 H11 C8 D5 C3
    And my opponent plays the hand H8 H4 H5 H7 H6
    Then my hand loses

  Scenario: Straight flush wins high card
    When I play the hand C10 C9 C11 C12 C13
    And my opponent plays the hand H1 H10 H11 H12 C8
    Then my hand wins

  Scenario: Straight flush wins pair
    When I play the hand C10 C9 C8 C7 C6
    And my opponent plays the hand C5 H5 D2 D3 H4
    Then my hand wins

  Scenario: Pair loses to straight flush
    When I play the hand H8 H10 S10 C5 D3
    And my opponent plays the hand C10 C8 C9 C12 C11
    Then my hand loses

  Scenario: Straight flush wins two pairs
    When I play the hand D6 D2 D3 D5 D4
    And my opponent plays the hand H9 D9 S10 H3 C3
    Then my hand wins

  Scenario: Two pairs loses to straight flush
    When I play the hand H10 S13 D13 C8 H8
    And my opponent plays the hand S3 S7 S5 S4 S6
    Then my hand loses

  Scenario: Three of a kind loses to straight flush
    When I play the hand S9 D3 C2 H9 D9
    And my opponent plays the hand C4 C7 C5 C6 C3
    Then my hand loses

  Scenario: Straight flush wins three of a kind
    When I play the hand D8 D7 D9 D10 D11
    And my opponent plays the hand H4 D12 C4 S4 D10
    Then my hand wins

  Scenario: Straight flush wins straight
    When I play the hand H10 H11 H12 H13 H9
    And my opponent plays the hand C3 D4 H2 C5 C6
    Then my hand wins

  Scenario: Straight loses to straight flush
    When I play the hand H8 D9 C11 C10 C12
    And my opponent plays the hand H3 H2 H5 H6 H7
    Then my hand loses

  Scenario: Straight flush wins flush
    When I play the hand S8 S6 S9 S7 S10
    And my opponent plays the hand S13 S11 S2 S4 S12
    Then my hand wins

  Scenario: Flush loses to straight flush
    When I play the hand D7 D13 D12 D5 D2
    And my opponent plays the hand H5 H6 H7 H9 H8
    Then my hand loses

  Scenario: Four of a kind loses to straight flush
    When I play the hand S4 D6 D4 H4 C4
    And my opponent plays the hand C8 C5 C6 C7 C9
    Then my hand loses

  Scenario: Straight flush wins four of a kind
    When I play the hand H9 H10 H12 H11 H13
    And my opponent plays the hand D1 H7 C7 S7 D7
    Then my hand wins

  Scenario: Full house loses to straight flush
    When I play the hand H10 D10 S2 D2 C2
    And my opponent plays the hand D8 D7 D6 D5 D4
    Then my hand loses

  Scenario: Straight flush wins full house
    When I play the hand C13 C1 C12 C11 C10
    And my opponent plays the hand H1 D1 S1 H12 S12
    Then my hand wins

  Scenario: Both players have a straight flush, straight flush with the lower highest card loses
    When I play the hand C9 C6 C8 C5 C7
    And my opponent plays the hand H6 H7 H8 H10 H9
    Then my hand loses

  Scenario: Both players have a straight flush, straight flush with the higher highest card wins
    When I play the hand C12 C11 C9 C8 C10
    And my opponent plays the hand D4 D7 D8 D6 D5
    Then my hand wins

  Scenario: Low straight flush with an ace wins full house
    When I play the hand C1 C5 C4 C3 C2
    And my opponent plays the hand D10 C10 H8 S10 S8
    Then my hand wins

  Scenario: Full house loses to low straight with an ace
    When I play the hand H12 C6 D6 S12 D12
    And my opponent plays the hand H5 H4 H1 H3 H2
    Then my hand loses

  Scenario: Low straight flush with ace loses to higher straight flush
    When I play the hand H1 H2 H3 H4 H5
    And my opponent plays the hand C2 C3 C4 C5 C6
    Then my hand loses

  Scenario: Higher straight flush wins low straight flush with ace
    When I play the hand D9 D7 D8 D10 D6
    And my opponent plays the hand D5 D3 D1 D2 D4
    Then my hand wins

  Scenario: High straight flush with an ace wins full house
    When I play the hand S10 S1 S13 S12 S11
    And my opponent plays the hand H10 C6 D6 S6 C10
    Then my hand wins

  Scenario: Full house loses to high straight flush with an ace
    When I play the hand H2 D2 S7 D7 C7
    And my opponent plays the hand D11 D12 D13 D1 D10
    Then my hand loses

  Scenario: High straight flush with an ace wins against lower straight flush
    When I play the hand S12 S11 S10 S13 S1
    And my opponent plays the hand H8 H9 H6 H10 H7
    Then my hand wins

  Scenario: Lower straight flush loses to a high straight flush with an ace
    When I play the hand C10 C7 C9 C11 C8
    And my opponent plays the hand H11 H1 H10 H13 H12
    Then my hand loses
