//
//  ThingCardView.swift
//  GTD
//
//  Created by Daniel Pustotin on 29.10.2021.
//

import SwiftUI

struct ThingCardView: View {
	@Binding var thing: Thing

	@State var presentingView: Bool = false

	let gradient = LinearGradient(colors: [.black.opacity(0.1), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom)

	var body: some View {
		ZStack {
			VStack {
				HStack {
					Text(thing.name)
				}
				HStack {
					Text(thing.body ?? "")
				}
				HStack {
					Text(thing.createdDateString)
				}
			}
		}
		.padding()
		.frame(width: screen.width / 2, height: screen.height / 6, alignment: .leading)
		.background(gradient)
		.clipShape(RoundedRectangle(cornerRadius: 20))
		.shadow(color: .black.opacity(0.9), radius: 10, x: 10, y: 10)
		.onTapGesture {
			presentingView = true
		}
		.sheet(isPresented: $presentingView) {
			ThingView(thing: $thing)
		}
	}
}

struct ThingCardView_Previews: PreviewProvider {
    static var previews: some View {
		ThingCardView(thing: .constant(Thing.random(Workspace())))
    }
}
