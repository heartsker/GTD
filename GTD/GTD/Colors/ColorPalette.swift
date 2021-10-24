//
//  ColorPalette.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation
import SwiftUI

extension Color {
	static let all: [Color] = [.brown, .yellow, .red, .blue, .gray, .cyan, .pink, .purple, .teal, .orange, .green]

	static var random: Color = {
		Color.all.randomElement()!
	}()
}
