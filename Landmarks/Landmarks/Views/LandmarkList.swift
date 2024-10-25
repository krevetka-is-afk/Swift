//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Сергей Растворов on 10/25/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
////            LandmarkRow(landmark: landmarks[0])
////            LandmarkRow(landmark: landmarks[1])
//        }
        
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
}
