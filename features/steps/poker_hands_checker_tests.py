from typing import List

from behave import *

from src.poker_hands_checker import compare_hands
from features.steps.random_hand_creators import *


@given("neither player has jokers in hand")
def step_impl(context):
    context.hand_creation_functions = []
    context.available_jokers = 0


@given("players may have jokers in hand")
def step_impl(context):
    context.hand_creation_functions = []
    context.available_jokers = 2


@when("I play the hand {hand}")
def step_impl(context, hand: str):
    context.first_hands = [_parse_hand(hand)]


@when("my opponent plays high card")
def step_impl(context):
    context.hand_creation_functions.append(create_high)


@when("I play a pair")
@when("my opponent plays a pair")
def step_impl(context):
    context.hand_creation_functions.append(create_pair)


@when("I play two pairs")
@when("my opponent plays two pairs")
def step_impl(context):
    context.hand_creation_functions.append(create_two_pairs)


@when("I play three of a kind")
@when("my opponent plays three of a kind")
def step_impl(context):
    context.hand_creation_functions.append(create_three_of_a_kind)


@when("I play a straight")
@when("my opponent plays a straight")
def step_impl(context):
    context.hand_creation_functions.append(create_straight)


@when("I play a flush")
@when("my opponent plays a flush")
def step_impl(context):
    context.hand_creation_functions.append(create_flush)


@when("I play a full house")
@when("my opponent plays a full house")
def step_impl(context):
    context.hand_creation_functions.append(create_full_house)


@when("I play four of a kind")
@when("my opponent plays four of a kind")
def step_impl(context):
    context.hand_creation_functions.append(create_four_of_a_kind)


@when("I play a straight flush")
@when("my opponent plays a straight flush")
def step_impl(context):
    context.hand_creation_functions.append(create_straight_flush)


@when("I play five of a kind")
def step_impl(context):
    context.hand_creation_functions.append(create_five_of_a_kind)
        

@when("my opponent plays the hand {hand}")
def step_impl(context, hand: str):
    context.second_hands = [_parse_hand(hand)]


def _create_hands(context):
    first_hands = []
    second_hands = []
    for _ in range(context.random_case_repetitions):
        original_jokers = context.available_jokers
        first_hands.append(context.hand_creation_functions[0](context))
        second_hands.append(context.hand_creation_functions[1](context))
        context.available_jokers = original_jokers
    return first_hands, second_hands


def _get_hands(context):
    if not context.first_hands:
        context.first_hands, context.second_hands = _create_hands(context)
    return zip(context.first_hands, context.second_hands)


@then("my hand wins")
def step_impl(context):
    for first_hand, second_hand in _get_hands(context):
        assert_expected_result(first_hand, second_hand, 1)
        assert_expected_result(second_hand, first_hand, -1)


@then("my hand loses")
def step_impl(context):
    for first_hand, second_hand in zip(context.first_hands, context.second_hands):
        assert_expected_result(first_hand, second_hand, -1)
        assert_expected_result(second_hand, first_hand, 1)


@then("it's a tie")
def step_impl(context):
    for first_hand, second_hand in zip(context.first_hands, context.second_hands):
        assert_expected_result(first_hand, second_hand, 0)
        assert_expected_result(second_hand, first_hand, 0)


def _parse_hand(hand: str) -> List[str]:
    return list(hand.split(" "))


def assert_expected_result(first_hand, second_hand, expected):
    try:
        result = compare_hands(first_hand, second_hand)
    except Exception as exception:
        print(f"An exception occurred while comparing hands {first_hand} and {second_hand}")
        raise exception
    assert type(result) == int, f"The type {type(result)} of received result {result} was not 'int'."
    assert result in range(-1, 2), f"Expected the result to be in the group {list(range(-1, 2))} but got {result} " \
                                   f"instead"
    assert result == expected, f"Expected hand {first_hand} to be {get_string(expected)} against hand {second_hand} " \
                               f"but the result was {get_string(result)}"


def get_string(expected) -> str:
    if expected == 0:
        return "tying (0)"
    return "winning (1)" if expected == 1 else "losing (-1)"
