//
// ContentView.swift
// Memorize
//
// Created by Chad Rutherford on 7/17/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var viewModel: EmojiMemoryGame
	var body: some View {
		HStack {
			ForEach(viewModel.cards) { card in
				CardView(card: card)
					.onTapGesture {
						viewModel.choose(card: card)
					}
			}
		}
		.padding()
		.foregroundColor(Color.orange)
		.font(.largeTitle)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(viewModel: EmojiMemoryGame())
	}
}
