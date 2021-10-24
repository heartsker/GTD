//
//  Tags.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation
import SwiftUI

class Tag: Hashable {

	var name: String
	var color: Color

	init(name: String) {
		self.name = name
		color = Color.random
	}

	static func == (lhs: Tag, rhs: Tag) -> Bool {
		lhs.name == rhs.name
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(name)
	}
}