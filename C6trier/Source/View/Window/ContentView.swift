//
//  ContentView.swift
//  C6trier
//
//  Created by Apple on 8/8/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(AppModel.self) private var appModel

    var body: some View {
        VStack {
            switch appModel.immersiveSpaceState {
            case .open:
                ControlView()
                    .padding(.bottom, 50)
            case .inTransition:
                ProgressView()
            case .closed:
                Text("Hello, user!")
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)
            }
            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment({
            let model = AppModel()
            model.immersiveSpaceState = .open
            return model
        }())
}
