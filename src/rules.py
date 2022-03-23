from typing import List

def parse_values(hand: List[str]):
    jokers = hand.count("J")
    if (jokers == 1):
        hand.remove("J")
    elif (jokers == 2):
        hand.remove("J")
        hand.remove("J")
    
    values = [int(card[1:]) for card in hand]
    values.sort()

    if jokers == 0:
        return values

    if jokers == 1:
        values.append("J")
    elif jokers == 2:
        values.append("J")
        values.append("J")
    return values

def check_high_card(hand1: List[str], hand2: List[str]):

    values1 = parse_values(hand1)
    values2 = parse_values(hand2)
    
    max1 = max(values1)
    max2 = max(values2)

    if max1 == max2:
        values1 = values1.remove(max1)
        values2 = values2.remove(max2)
        fake_hand1 = []
        fake_hand2 = []
        for v1 in values1:
            fake_hand1.append(f"D{v1}")
        
        for v2 in values2:
            fake_hand2.append(f"D{v2}")

        return check_high_card(fake_hand1, fake_hand2)
        

    if max1 > max2:
        return 1
    else: 
        return 2


def five_of_kind(hand: List[str]) -> int:
    res = True
    card_old = hand[0]

    for card in hand:
        if card[1:] != card_old[1:] and card != "J":
            res = False

    if (res):
        return 11
    
    return 0


def flush(hand: List[str]) -> int:
    res = True
    card_old = hand[0]

    for card in hand:
        if card[:1] != card_old[:1] and card != "J":
            res = False

    if (res):
        return 6

    return 0


def straight(hand: List[str]) -> int:
    res = True
    values = parse_values(hand)
    for i in range(0,4):
        if (values[i]+1 != values[i+1]):
            res = False
    if (res):
        return 5
    return 0


def royal_flush(hand: List[str]) -> int:
    res = True
    values=parse_values(hand)
    if flush(hand) == 6:
        if values[0] == 1 and values[1] == 10:
            return 10
    return 0


def four_of_a_kind(hand: List[str]) -> int:
    res = False
    values=parse_values(hand)
    
    for value in values:
        times = values.count(value)
        if (times == 4):
            res = True
        elif times == 3 and values.count("J")==1:
            res = True
        elif times == 2 and values.count("J")==2:
            res = True

    if (res):
        return 8
    
    return 0


def full_house(hand: List[str]) -> int:
    values = parse_values(hand)
    res = True
    
    small = False
    big = False
    
    for value in values:
        times = values.count(value)

        if times == 3:
            big = True
        elif times == 2:
            small = True
    
    if big and small:
        return 7
       
    return 0
    


def three_of_a_kind(hand: List[str]) -> int:
    res = False
    values=parse_values(hand)
    
    for value in values:
        times = values.count(value)
        if (times == 3):
            res = True
        elif times == 2 and values.count("J")==1:
            res = True
        elif times == 1 and values.count("J")==2:
            res = True

    if (res):
        return 4
        

    return 0

def two_pairs(hand: List[str]) -> int:
    values=parse_values(hand)
    pairs = 0
    for value in values:
        times = values.count(value)
        if (times == 2):
            pairs+=1

    if pairs == 4:
        return 4

    return 0


def pair(hand: List[str]) -> int:
    res = False
    values=parse_values(hand)
    
    for value in values:
        times = values.count(value)
        if (times == 2):
            res = True
        elif (times == 1 and values.count("J")):
            res = True

    if (res):
        return 4

    return 0

def high_card(hand: List[str]) -> int:
    return 1


def straight_flush(hand: List[str]) -> int:
    res = True
    if flush(hand) == 6 and straight(hand) == 5:
        return 10
    return 0
