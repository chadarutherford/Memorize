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
		VStack {
			Grid(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					withAnimation(.linear(duration: 0.75)) {
						viewModel.choose(card)
					}
				}
				.padding(5)
			}
			.padding()
			.foregroundColor(Color.orange)
			
			Button (action: {
				withAnimation(.easeInOut) {
					viewModel.resetGame()
				}
			}, label: {
				Text("New Game")
			})
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
	}
}
