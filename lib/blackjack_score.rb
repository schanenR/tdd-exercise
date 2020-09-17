# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']


def blackjack_score(hand)
  sum = 0
  ace_count = 0
  valid_hand = nil
  match_count = 0
  hand.each do |card|
    VALID_CARDS.each do |deck_option|
      if card == deck_option
        match_count += 1
      end
    end
  end
  if match_count == hand.length
    valid_hand = true
  else
    valid_hand = false
  end

  if valid_hand == true

    hand.each do |card|
      if card.is_a? Numeric
        sum += card
      elsif card == "Jack" || card == "Queen" || card == "King"
        sum += 10
      elsif card == "Ace"
        ace_count += 1
      end
    end

    if (ace_count * 11 + sum) < 22
      sum += (ace_count * 11)
    elsif (((ace_count - 1) * 11) + 1) + sum < 22
      sum += ((ace_count - 1) * 11) + 1
    else
      sum += ace_count * 1
    end

    if sum < 22
      return sum
    else
      raise ArgumentError.new("This hand has scored above the max: 21")
    end

  else
    raise ArgumentError.new("The hand includes invalid cards.")
  end

end
