__author__ = "MustacheCorp Eddie"

import random
from typing import List

from behave.runner import Context


def create_high(context: Context) -> List[str]:
    numbers = sorted(_create_distinct_values(7))
    numbers.pop(random.randint(1, 2))
    numbers.pop(random.randint(3, 4))
    random.shuffle(numbers)
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand(numbers, suites)


def create_pair(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context, 1)
    return _create_joker_pair() if jokers_used else _create_pair()


def _create_pair() -> List[str]:
    numbers = _create_distinct_values(4)
    numbers.append(random.choice(numbers))
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand(numbers, suites)


def _create_joker_pair() -> List[str]:
    numbers = sorted(_create_distinct_values(7))
    numbers.pop(2)
    numbers.pop(2)
    numbers.pop(2)
    random.shuffle(numbers)
    suites = _create_suites()
    return _create_hand_with_jokers(numbers, suites, 1)


def create_two_pairs(context: Context) -> List[str]:
    numbers = _create_distinct_values(3)
    numbers += numbers
    numbers.remove(random.choice(numbers))
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand(numbers, suites)


def create_three_of_a_kind(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context)
    return _create_joker_three_of_a_kind(jokers_used)


def _create_joker_three_of_a_kind(joker_amount: int) -> List[str]:
    numbers = sorted(_create_distinct_values(3 if joker_amount <= 1 else 6))
    if joker_amount == 0:
        random_number = random.choice(numbers)
        numbers.append(random_number)
        numbers.append(random_number)
    elif joker_amount == 1:
        numbers.append(random.choice(numbers))
    else:
        numbers.pop(2)
        numbers.pop(2)
        numbers.pop(2)
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand_with_jokers(numbers, suites, joker_amount)


def create_straight(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context)
    return _create_joker_straight(jokers_used)


def _create_joker_straight(joker_amount: int) -> List[str]:
    start = random.randint(1, 10)
    numbers = [max(number % 14, 1) for number in range(start, start + 5)]
    suites = _create_suites()
    random.shuffle(numbers)
    for _ in range(joker_amount):
        numbers.pop(0)
    return _create_hand_with_jokers(numbers, suites, joker_amount)


def create_flush(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context)
    return _create_joker_flush(jokers_used)


def _create_joker_flush(joker_amount: int) -> List[str]:
    numbers = sorted(_create_distinct_values(6))
    numbers.pop(random.randint(2, 4))
    suites = _create_suites(flush=True)
    for _ in range(joker_amount):
        numbers.pop(2)
    random.shuffle(numbers)
    return _create_hand_with_jokers(numbers, suites, joker_amount)


def create_full_house(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context, 1)
    return _create_joker_full_house() if jokers_used else _create_full_house()


def _create_full_house() -> List[str]:
    numbers = _create_distinct_values(2) * 3
    numbers.remove(random.choice(numbers))
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand(numbers, suites)


def _create_joker_full_house() -> List[str]:
    numbers = _create_distinct_values(2) * 2
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand_with_jokers(numbers, suites, 1)


def create_four_of_a_kind(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context)
    return _create_joker_four_of_a_kind(jokers_used)


def _create_joker_four_of_a_kind(joker_amount: int) -> List[str]:
    numbers = _create_distinct_values(2)
    numbers += [numbers[1]] * (3-joker_amount)
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand_with_jokers(numbers, suites, joker_amount)


def create_straight_flush(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context)
    return _create_joker_straight_flush(jokers_used)


def _create_joker_straight_flush(joker_amount: int) -> List[str]:
    start = random.randint(1, 10)
    numbers = [max(number % 14, 1) for number in range(start, start + 5)]
    suites = _create_suites(flush=True)
    random.shuffle(numbers)
    for _ in range(joker_amount):
        numbers.pop(0)
    return _create_hand_with_jokers(numbers, suites, joker_amount)


def create_five_of_a_kind(context: Context) -> List[str]:
    jokers_used = _randomize_used_joker_amount(context, 2, 1)
    return _create_joker_five_of_a_kind(jokers_used)


def _create_joker_five_of_a_kind(joker_amount):
    numbers = _create_distinct_values(1) * (5 - joker_amount)
    suites = _create_suites()
    random.shuffle(numbers)
    return _create_hand_with_jokers(numbers, suites, joker_amount)


def _create_distinct_values(amount: int) -> List[int]:
    values = []
    while len(values) < amount:
        new_value = random.randint(1, 13)
        if new_value not in values:
            values.append(new_value)
    return values


def _create_suites(*, flush: bool = False) -> List[str]:
    possible = ["H", "S", "D", "C"]
    if flush:
        return [random.choice(possible)] * 5
    else:
        index = random.randint(0, 3)
        suites = [possible[index]]
        for suite in range(index, index + 4):
            suites.append(possible[suite % 4])
        return suites


def _randomize_used_joker_amount(context, maximum_used_jokers=10, minimum_used_jokers=0):
    assert context.available_jokers >= minimum_used_jokers, "Test setup corrupted! Please contact Koodausta ja " \
                                                            "Kisailua 2022 organizers."
    jokers_used = random.randint(minimum_used_jokers, min(context.available_jokers, maximum_used_jokers))
    context.available_jokers -= jokers_used
    return jokers_used


def _create_hand(numbers: List[int], suites: List[str]):
    return [f"{suite}{number}" for suite, number in zip(suites, numbers)]


def _create_hand_with_jokers(numbers: List[int], suites: List[str], joker_amount: int):
    zipped = [f"{suite}{number}" for suite, number in zip(suites, numbers)]
    for _ in range(joker_amount):
        zipped.append("J")
    random.shuffle(zipped)
    return zipped
