//
// Array+Ext.swift
// Memorize
//
// Created by Chad Rutherford on 7/29/20.
// Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
	func firstIndex(matching: Element) -> Int {
		for index in 0 ..< self.count {
			if self[index].id == matching.id {
				return index
			}
		}
		return 0 // TODO: bogus!
	}
}
