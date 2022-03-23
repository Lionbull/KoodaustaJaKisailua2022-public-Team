from typing import List
from src.rules import five_of_kind, flush, royal_flush, four_of_a_kind, full_house, straight, three_of_a_kind, two_pairs, pair, high_card, straight_flush, check_high_card


colors = ["D", "S", "H", "C"]


def generate_pack():
    pack = []

    for color in colors:
        for i in range(1, 14):
            card = f"{color}{i}"
            pack.append(card)

    pack.append("J")
    pack.append("J")

    return pack




def compare_hands(first_hand: List[str], second_hand: List[str]) -> int:
    rule_list = [five_of_kind, flush, royal_flush, four_of_a_kind, full_house,
                 straight, three_of_a_kind, two_pairs, pair, high_card, straight_flush]

    player1 = 0
    player2 = 0

    pack: List[str] = generate_pack()
    #print(five_of_kind(["D13", "D13", "D13", "J", "J"]))

    for rule in rule_list:
        points1 = rule(first_hand)
        points2 = rule(second_hand)

        if (points1 > player1):
            player1 = points1

        if (points2 > player2):
            player2 = points2

    if (player1 > player2):
        return 1
    
    # Checks high card
    elif (player1 == player2):
        w = check_high_card(first_hand, second_hand)
        if (w == 1):
            return 1
        
        elif (w == 3):
            return 0

        else:
            return -1

    else:
        return -1
