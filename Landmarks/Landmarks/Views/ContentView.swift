//
//  ContentView.swift
//  Landmarks
//
//  Created by Сергей Растворов on 10/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
