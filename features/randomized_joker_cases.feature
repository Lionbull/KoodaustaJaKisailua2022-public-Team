# Created by MustacheCorp at 21/12/2021
Feature: MustacheCorp poker hand checker hand comparison function randomized hand tests with jokers
  As a middle director
  I want to ensure the engineers don't hard-code solutions
  So I know they do their work properly

  Scenario: Pair wins high card
    Given players may have jokers in hand
    When I play a pair
    And my opponent plays high card
    Then my hand wins

  Scenario: Two pairs wins pair
    Given players may have jokers in hand
    When I play two pairs
    And my opponent plays a pair
    Then my hand wins

  Scenario: Two pairs wins high card
    Given players may have jokers in hand
    When I play two pairs
    And my opponent plays high card
    Then my hand wins

  Scenario: Three of a kind wins two pairs
    Given players may have jokers in hand
    When I play three of a kind
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Three of a kind wins pair
    Given players may have jokers in hand
    When I play three of a kind
    And my opponent plays a pair
    Then my hand wins

  Scenario: Three of a kind wins high card
    Given players may have jokers in hand
    When I play three of a kind
    And my opponent plays high card
    Then my hand wins

  Scenario: Straight wins three of a kind
    Given players may have jokers in hand
    When I play a straight
    And my opponent plays three of a kind
    Then my hand wins

  Scenario: Straight wins two pairs
    Given players may have jokers in hand
    When I play a straight
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Straight wins pair
    Given players may have jokers in hand
    When I play a straight
    And my opponent plays a pair
    Then my hand wins

  Scenario: Straight wins high card
    Given players may have jokers in hand
    When I play a straight
    And my opponent plays high card
    Then my hand wins

  Scenario: Flush wins straight
    Given players may have jokers in hand
    When I play a flush
    And my opponent plays a straight
    Then my hand wins

  Scenario: Flush wins three of a kind
    Given players may have jokers in hand
    When I play a flush
    And my opponent plays three of a kind
    Then my hand wins

  Scenario: Flush wins two pairs
    Given players may have jokers in hand
    When I play a flush
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Flush wins pair
    Given players may have jokers in hand
    When I play a flush
    And my opponent plays a pair
    Then my hand wins

  Scenario: Flush wins high card
    Given players may have jokers in hand
    When I play a flush
    And my opponent plays high card
    Then my hand wins

  Scenario: Full house wins flush
    Given players may have jokers in hand
    When I play a full house
    And my opponent plays a flush
    Then my hand wins

  Scenario: Full house wins straight
    Given players may have jokers in hand
    When I play a full house
    And my opponent plays a straight
    Then my hand wins

  Scenario: Full house three of a kind
    Given players may have jokers in hand
    When I play a full house
    And my opponent plays three of a kind
    Then my hand wins

  Scenario: Full house two pairs
    Given players may have jokers in hand
    When I play a full house
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Full house wins a pair
    Given players may have jokers in hand
    When I play a full house
    And my opponent plays a pair
    Then my hand wins

  Scenario: Full house wins high card
    Given players may have jokers in hand
    When I play a full house
    And my opponent plays high card
    Then my hand wins

  Scenario: Four of a kind wins full house
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays a full house
    Then my hand wins

  Scenario: Four of a kind wins flush
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays a flush
    Then my hand wins

  Scenario: Four of a kind wins straight
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays a straight
    Then my hand wins

  Scenario: Four of a kind wins three of a kind
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays three of a kind
    Then my hand wins

  Scenario: Four of a kind wins two pairs
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Four of a kind wins pair
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays a pair
    Then my hand wins

  Scenario: Four of a kind wins high card
    Given players may have jokers in hand
    When I play four of a kind
    And my opponent plays high card
    Then my hand wins

  Scenario: Straight flush wins four of a kind
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays four of a kind
    Then my hand wins

  Scenario: Straight flush wins full house
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays a full house
    Then my hand wins

  Scenario: Straight flush wins flush
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays a flush
    Then my hand wins

  Scenario: Straight flush wins straight
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays a straight
    Then my hand wins

  Scenario: Straight flush wins three of a kind
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays three of a kind
    Then my hand wins

  Scenario: Straight flush wins two pairs
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Straight flush wins pair
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays a pair
    Then my hand wins

  Scenario: Straight flush wins high card
    Given players may have jokers in hand
    When I play a straight flush
    And my opponent plays high card
    Then my hand wins

  Scenario: Five of a kind wins straight flush
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays a straight flush
    Then my hand wins

  Scenario: Five of a kind wins four of a kind
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays four of a kind
    Then my hand wins

  Scenario: Five of a kind wins full house
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays a full house
    Then my hand wins

  Scenario: Five of a kind wins flush
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays a flush
    Then my hand wins

  Scenario: Five of a kind wins straight
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays a straight
    Then my hand wins

  Scenario: Five of a kind wins three of a kind
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays three of a kind
    Then my hand wins

  Scenario: Five of a kind wins two pairs
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays two pairs
    Then my hand wins

  Scenario: Five of a kind wins pair
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays a pair
    Then my hand wins

  Scenario: Five of a kind wins high card
    Given players may have jokers in hand
    When I play five of a kind
    And my opponent plays high card
    Then my hand wins
