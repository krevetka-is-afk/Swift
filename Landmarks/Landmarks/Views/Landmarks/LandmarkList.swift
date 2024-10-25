//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Сергей Растворов on 10/25/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in (!showFavoritesOnly || landmark.isFavorite)}
    }
    
    var body: some View {
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
////            LandmarkRow(landmark: landmarks[0])
////            LandmarkRow(landmark: landmarks[1])
//        }
        
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
}
