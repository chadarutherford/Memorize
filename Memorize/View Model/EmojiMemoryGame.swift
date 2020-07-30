//
// EmojiMemoryGame.swift
// Memorize
//
// Created by Chad Rutherford on 7/17/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
	@Published private var game: MemoryGame<String> = createMemoryGame()
	
	private static func createMemoryGame() -> MemoryGame<String> {
		let emojis = ["👻", "🎃", "🕷"]
		return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
			return emojis[pairIndex]
		}
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Model Access
	var cards: Array<MemoryGame<String>.Card> {
		game.cards
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Intent
	func choose(_ card: MemoryGame<String>.Card) {
		game.choose(card)
	}
}
