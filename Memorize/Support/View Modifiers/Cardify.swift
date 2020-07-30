//
// Cardify.swift
// Memorize
//
// Created by Chad Rutherford on 7/30/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
	
	var rotation: Double
	var isFaceUp: Bool {
		rotation < 90
	}
	
	var animatableData: Double {
		get { rotation }
		set { rotation = newValue }
	}
	
	init(isFaceUp: Bool) {
		rotation = isFaceUp ? 0 : 180
	}
	
	func body(content: Content) -> some View {
		ZStack {
			Group {
				RoundedRectangle(cornerRadius: Size.cornerRadius)
					.fill(Color.white)
				RoundedRectangle(cornerRadius: Size.cornerRadius)
					.stroke(lineWidth: Size.lineWidth)
				content
			}
			.opacity(isFaceUp ? 1 : 0)
			
			RoundedRectangle(cornerRadius: Size.cornerRadius)
				.fill()
				.opacity(isFaceUp ? 0 : 1)
		}
		.rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
	}
}











