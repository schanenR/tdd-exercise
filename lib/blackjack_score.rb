# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  sum = 0
  ace_count = 0
  hand.each do |card|
    if card.is_a? Numeric
      sum += card
    elsif card == "Jack" || card == "Queen" || card == "King"
      sum += 10
    elsif card == "Ace"
      ace_count += 1
    end
  end
  until ace_count == 0
    if sum > 10
      sum += 1
      ace_count -= 1
    else
      sum += 11
      ace_count -= 1
    end
  end

  return sum

end
