B = (1..15).to_a
I = (16..30).to_a
N = (31..45).to_a
G = (46..60).to_a
O = (61..75).to_a

def bingo_card
  card_number = [B, I, N, G, O].map { |bingo| 
    bingo.sample(5) }.transpose
  card_number[2][2] = "FREE"
  card_number.map { |card| 
    card.map { |number| 
      number.to_s.rjust(2) }.join("  ")
  }.join("\n")
end

puts bingo_card
