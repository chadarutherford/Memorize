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
		GeometryReader { geometry in 
			body(for: geometry.size)
		}
	}
	
	private func body(for size: CGSize) -> some View {
		ZStack {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: Size.cornerRadius)
					.fill(Color.white)
				RoundedRectangle(cornerRadius: Size.cornerRadius)
					.stroke(lineWidth: Size.lineWidth)
				Text(card.content)
			} else {
				if !card.isMatched {
					RoundedRectangle(cornerRadius: Size.cornerRadius)
						.fill()
				}
			}
		}
		.font(Font.system(size: fontSize(for: size)))
	}
	
	private func fontSize(for size: CGSize) -> CGFloat {
		min(size.width, size.height) * Size.multiplier
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		CardView(card: MemoryGame<String>.Card(id: 0, isFaceUp: true, isMatched: false, content: "👻"))
	}
}
