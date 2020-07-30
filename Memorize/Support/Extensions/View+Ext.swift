//
// View+Ext.swift
// Memorize
//
// Created by Chad Rutherford on 7/30/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import SwiftUI

extension View {
	func cardify(isFaceUp: Bool) -> some View {
		modifier(Cardify(isFaceUp: isFaceUp))
	}
}
