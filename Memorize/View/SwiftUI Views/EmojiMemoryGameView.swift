//
// EmojiMemoryGameView.swift
// Memorize
//
// Created by Chad Rutherford on 7/17/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	var body: some View {
		Grid(viewModel.cards) { card in
			CardView(card: card).onTapGesture {
					viewModel.choose(card)
			}
			.padding(5)
		}
		.padding(10)
		.foregroundColor(Color.orange)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
	}
}
