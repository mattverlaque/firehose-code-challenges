class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end

class Deck
  attr_accessor :deck

  def initialize                                            # Init Method
    @deck = []                                              # Empty Array for deck
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]       # Set array of suits
    suits.each do |s|                                       # Iterate over each suit
      r = 2                                                 # Init counter for number cards
      9.times do                                            # Run 9 times => 9 number cards
        card = Card.new(r, s)                               # Generate new number card
        @deck << card                                       # Push new card to deck array
        r += 1                                              # Increment number card counter
      end                                                   # End number card generation
      @deck << Card.new("Ace", s)                           # Generate face cards for each suit
      @deck << Card.new("King", s)
      @deck << Card.new("Queen", s)
      @deck << Card.new("Jack", s)
    end
  end

  def shuffle
    @deck.shuffle!                                                              # array.shuffle! to mix up the array values
  end                                                                           # and store them back inside the array

  def deal
    current_card = @deck.shift                                                  # array.shift to take top card
    puts "Your card is the #{current_card.rank} of #{current_card.suit}."       # puts the top card
  end
end

thedeck = Deck.new                                      # Create new deck
thedeck.shuffle                                         # Shuffle deck
thedeck.deal                                            # Deal card from top of deck