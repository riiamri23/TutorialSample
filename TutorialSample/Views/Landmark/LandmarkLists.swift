//
//  LandmarkLists.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView{
            List (landmarks, id: \.id) { landmark in 
            NavigationLink{
                LandmarkDetail(landmark: landmark)
            } label: {
                LandmarkRow(landmark: landmark)
            }
            }.navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview("Landmark") {
    LandmarkList()
}
