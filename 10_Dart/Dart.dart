void main() {
  var deck = Deck();
  // deck.shuffle();
  print(deck);
  // print(deck.cardsWithSuit('Two'));
  // print(deck.cardsWithRank('Diamonds'));
  // print(deck.deal(5));
  deck.removeCard('Five', 'Spades');
  print(deck);
}

class Deck {
  List<Card> cards = [];

  Deck() {
    var suits = ['Ace', 'Two','Three', 'Four', 'Five'];
    var ranks = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];

    for (var rank in ranks) {
      for (var suit in suits) {
        var card = Card(suit: suit, rank: rank);
        cards.add(card);
      }
    }
  }
  @override
  String toString() {
    // TODO: implement toString
    return cards.toString();
  }

  shuffle() {
    cards.shuffle();
  }

  cardsWithSuit(String suit) {
    return cards.where((card) {
      return card.suit == suit;
    });
  }

  cardsWithRank(String rank) {
    return cards.where((card) => card.rank == rank);
  }

  deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);
    return hand;
  }

  removeCard(String suit, String rank) {
    cards.removeWhere((card) {
      return (card.suit == suit) && (card.rank == rank);
    });
  }
}

class Card {
  String suit;
  String rank;

  Card({required this.suit, required this.rank});
  @override
  String toString() {
    // TODO: implement toString
    return '$suit of $rank';
  }
}