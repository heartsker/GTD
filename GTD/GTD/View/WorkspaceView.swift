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

			Button {
				print("💥💥💥")
				print(workspace)
			} label: {
				Text("💥💥💥")
			}

			ScrollView(.horizontal) {
				HStack {
					ForEach(Array(workspace.stacks.values), id: \.self) { stack in
						StackView(stack: stack)
					}
				}
			}
			.padding()

			Button {
				print(workspace)
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
