//
// MemoryGame.swift
// Memorize
//
// Created by Chad Rutherford on 7/17/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
	var cards: Array<Card>
	
	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		cards = [Card]()
		for pairIndex in 0 ..< numberOfPairsOfCards {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(id: pairIndex * 2, content: content))
			cards.append(Card(id: pairIndex * 2 + 1, content: content))
		}
	}
	
	mutating func choose(_ card: Card) {
		print("Card chosen: \(card)")
		let chosenIndex = index(of: card)
		cards[chosenIndex].isFaceUp.toggle()
	}
	
	private func index(of card: Card) -> Int {
		for index in 0 ..< cards.count {
			if cards[index].id == card.id {
				return index
			}
		}
		return 0 // TODO: bogus!
	}
	
	struct Card: Identifiable {
		var id: Int
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}
