//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Сергей Растворов on 10/24/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
