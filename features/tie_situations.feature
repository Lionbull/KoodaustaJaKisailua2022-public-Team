# Created by MustacheCorp at 07/12/2021
Feature: MustacheCorp poker hand checker hand comparison function tying hand scenarios
  As a tipsy QA engineer
  I want to prepare for situations where the checker encounters a tie
  In order to ensure corner cases are accounted for

  Scenario: High cards with identical card values tie
    When I play the hand H3 D8 C10 H1 C9
    And my opponent plays the hand S9 H10 S3 D1 C8
    Then it's a tie

  Scenario: Pairs with identical pair and remaining card values tie
    When I play the hand H9 D10 C10 S7 D3
    And my opponent plays the hand H3 C7 H10 S9 S10
    Then it's a tie

  Scenario: Pairs with identical pair and remaining card values tie if other has joker
    When I play the hand H10 J C8 D4 C1
    And my opponent plays the hand D1 H8 D4 S1 S10
    Then it's a tie

  Scenario: Pairs with identical pair and remaining card values tie if both have joker
    When I play the hand C10 D6 J C12 H5
    And my opponent plays the hand J H12 D10 S6 S5
    Then it's a tie

  Scenario: Two pairs with identical pairs and extra card values tie
    When I play the hand D8 H8 C1 H10 S1
    And my opponent plays the hand H1 C10 C8 S8 D1
    Then it's a tie

  Scenario: Three of a kind with identical tripled card and remaining card values tie if both have joker
    When I play the hand H6 D4 J C6 S8
    And my opponent plays the hand J S6 C8 H4 D6
    Then it's a tie

  Scenario: Three of a kind with identical tripled card and remaining card values tie if other has two jokers
    When I play the hand J H10 C12 D4 J
    And my opponent plays the hand H12 D12 S12 D10 S4
    Then it's a tie

  Scenario: Straights with identical highest card values tie
    When I play the hand H8 D7 S10 C11 H9
    And my opponent plays the hand S11 H7 D10 S8 C9
    Then it's a tie

  Scenario: Straights with identical highest card values tie if other has joker
    When I play the hand D8 J H10 C9 S7
    And my opponent plays the hand S11 C10 D9 H8 H7
    Then it's a tie

  Scenario: Straights with identical highest card values tie if both have joker
    When I play the hand J S8 D9 C6 C5
    And my opponent plays the hand S7 H8 C9 D5 J
    Then it's a tie

  Scenario: Straights with identical highest card values tie if other has two jokers
    When I play the hand J H8 D10 J C9
    And my opponent plays the hand C8 D9 H10 S11 D12
    Then it's a tie

  Scenario: High straights with identical highest card values tie if other has joker
    When I play the hand C11 D12 C13 H1 J
    And my opponent plays the hand H10 S11 S1 H13 S12
    Then it's a tie

  Scenario: High straights with identical highest card values tie if both have joker
    When I play the hand D10 C13 J S12 H11
    And my opponent plays the hand J H11 D12 S10 C1
    Then it's a tie

  Scenario: High straights with identical highest card values tie if one has two jokers
    When I play the hand H11 D12 D13 J J
    And my opponent plays the hand C1 D13 S11 D10 S12
    Then it's a tie

  Scenario: Flushes with identical card values tie
    When I play the hand D5 D4 D10 D13 D1
    And my opponent plays the hand S13 S1 S4 S10 S5
    Then it's a tie

  Scenario: Flushes with identical card values tie if other has joker
    When I play the hand J H10 H8 H4 H12
    And my opponent plays the hand C10 C4 C1 C12 C8
    Then it's a tie

  Scenario: Flushes with identical card values tie if both have joker
    When I play the hand J S4 S3 S8 S2
    And my opponent plays the hand D2 D8 D3 J D4
    Then it's a tie

  Scenario: Full houses with identical triple and double card values tie if both have joker
    When I play the hand S10 D10 H8 J C8
    And my opponent plays the hand J H10 C10 S8 D8
    Then it's a tie

  Scenario: Straight flushes with identical highest card values tie
    When I play the hand H8 H11 H12 H10 H9
    And my opponent plays the hand S11 S10 S12 S8 S9
    Then it's a tie

  Scenario: Straight flushes with identical highest card values tie if other has joker
    When I play the hand S4 J S6 S5 S7
    And my opponent plays the hand H8 H4 H5 H7 H6
    Then it's a tie

  Scenario: Straight flushes with identical highest card values tie if both have joker
    When I play the hand D9 J D8 D7 D10
    And my opponent plays the hand S8 S7 S9 S11 J
    Then it's a tie

  Scenario: Straight flushes with identical highest card values tie if other has two jokers
    When I play the hand D7 J D8 J D9
    And my opponent plays the hand C8 C9 C10 C11 C7
    Then it's a tie

  Scenario: High straight flushes with identical highest card values tie if other has joker
    When I play the hand C1 C11 C12 J C13
    And my opponent plays the hand H11 H1 H10 H13 H12
    Then it's a tie

  Scenario: High straight flushes with identical highest card values tie if both have joker
    When I play the hand D13 D10 J D12 D11
    And my opponent plays the hand S12 S11 S10 J S1
    Then it's a tie

  Scenario: High straight flushes with identical highest card values tie if one has two jokers
    When I play the hand D12 D11 J D13 J
    And my opponent plays the hand S12 S13 S11 S1 S10
    Then it's a tie