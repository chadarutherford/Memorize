//
// MemoryGame.swift
// Memorize
//
// Created by Chad Rutherford on 7/17/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
	
	private(set) var cards: Array<Card>
	private var indexOfTheOneAndOnlyFaceUpCard: Int? {
		get { cards.indices.filter { cards[$0].isFaceUp }.only }
		set {
			for index in cards.indices {
				cards[index].isFaceUp = index == newValue
			}
		}
	}
	
	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		cards = [Card]()
		for pairIndex in 0 ..< numberOfPairsOfCards {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(id: pairIndex * 2, content: content))
			cards.append(Card(id: pairIndex * 2 + 1, content: content))
		}
	}
	
	mutating func choose(_ card: Card) {
		guard let chosenIndex = cards.firstIndex(matching: card),
			  !cards[chosenIndex].isFaceUp,
			  !cards[chosenIndex].isMatched else { return }
		guard let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard else {
			indexOfTheOneAndOnlyFaceUpCard = chosenIndex
			return
		}
		if cards[chosenIndex].content == cards[potentialMatchIndex].content {
			cards[chosenIndex].isMatched = true
			cards[potentialMatchIndex].isMatched = true
		}
		cards[chosenIndex].isFaceUp = true
	}
	
	
	
	struct Card: Identifiable {
		var id: Int
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}
