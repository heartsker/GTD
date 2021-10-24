//
//  ColorPalette.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation
import SwiftUI

enum ColorPalette: String, CaseIterable {
	case red
	case blue
	case yellow
	case cyan
	case brown
	case pink
	case purple
	case mint
	case indigo
	case gray
	case orange
	case teal

	static var random: ColorPalette {
		ColorPalette.allCases.randomElement()!
	}
}
