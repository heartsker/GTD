	//
	//  StackView.swift
	//  GTD
	//
	//  Created by Daniel Pustotin on 30.10.2021.
	//

import SwiftUI

struct StackView: View {

	@ObservedObject var stack: Stack

	var body: some View {

		VStack {
			Text(stack.type.rawValue)
				.font(.largeTitle)

			ScrollView {
				VStack {
					ForEach(stack.content) { thing in
					VStack {
						ThingCardView(thing: Binding(get: { thing }, set: { thing.update(thing: $0) })).id(thing.hashValue)
					}
				}
				}
			}
		}
		.frame(width: screen.width / 2)
	}
}

struct StackView_Previews: PreviewProvider {
	@State var stack: Stack = .init(.all)
	static var previews: some View {
		StackView(stack: Stack(.all))
	}
}
