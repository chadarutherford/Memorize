//
// CardView.swift
// Memorize
//
// Created by Chad Rutherford on 7/19/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

struct CardView: View {
	
	@State private var animatedBonusRemaining: Double = 0
	
	var card: MemoryGame<String>.Card
	
	var body: some View {
		GeometryReader { geometry in 
			body(for: geometry.size)
		}
	}
	
	@ViewBuilder
	private func body(for size: CGSize) -> some View {
		if card.isFaceUp || !card.isMatched {
			ZStack {
				Group {
					if card.isConsumingBonusTime {
						Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(-animatedBonusRemaining * 360 - 90), clockwise: true)
							.onAppear {
								startBonusTimeAnimation()
							}
					} else {
						Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90), clockwise: true)
					}
				}
				.padding(8)
				.opacity(0.35)
				
				Text(card.content)
					.font(Font.system(size: fontSize(for: size)))
					.rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
					.animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
			}
			.cardify(isFaceUp: card.isFaceUp)
			.transition(.scale)
		}
	}
	
	private func startBonusTimeAnimation() {
		animatedBonusRemaining = card.bonusRemaining
		withAnimation(.linear(duration: card.bonusTimeRemaining)) {
			animatedBonusRemaining = 0
		}
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
