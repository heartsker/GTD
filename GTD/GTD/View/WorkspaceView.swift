//
//  WorkspaceView.swift
//  GTD
//
//  Created by Daniel Pustotin on 29.10.2021.
//

import SwiftUI

struct WorkspaceView: View {
	@EnvironmentObject var workspace: Workspace

	@State var presentingNewThingView: Bool = false

    var body: some View {
		VStack {
			Text(workspace.name)
				.font(.largeTitle)


			ScrollView(.horizontal) {
				HStack {
					ForEach(StackType.allCases, id: \.rawValue) { type in
						StackView(stack: Binding(get: { workspace.stacks[type]!}, set: {workspace.stacks[type]! = $0}))
					}
				}
			}

			Button {
				presentingNewThingView = true
			} label: {
				Text("New")
			}

		}
		.sheet(isPresented: $presentingNewThingView) {
			NewThingView(presenting: $presentingNewThingView)
		}
    }
}

struct WorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
		WorkspaceView()
			.environmentObject(Workspace())
    }
}
