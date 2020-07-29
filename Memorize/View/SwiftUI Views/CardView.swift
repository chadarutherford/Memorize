//
// CardView.swift
// Memorize
//
// Created by Chad Rutherford on 7/19/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

struct CardView: View {
	
	var card: MemoryGame<String>.Card
	
	var body: some View {
		ZStack {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: 10.0)
					.fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0)
					.stroke(lineWidth: 3)
				Text(card.content)
			} else {
				RoundedRectangle(cornerRadius: 10.0)
					.fill()
			}
		}
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		CardView(card: MemoryGame<String>.Card(id: 0, content: "👻"))
	}
}
