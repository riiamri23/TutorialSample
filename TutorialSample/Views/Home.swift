//
//  LandmarkLists.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI


struct HomeApp: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("List Example App")
                
                NavigationLink(destination: GaugeExample()) {
                    Text("GaugeExample")
                }
                NavigationLink(destination: LandmarkList()) {
                    Text("LandmarkList")
                }
                NavigationLink(destination: WebviewExample()) {
                    Text("WebviewExample")
                }
                NavigationLink(destination: BookListView()) {
                    Text("BookListView")
                }
            }
        
        }
    }
}


#Preview("HomeApp") {
    HomeApp()
}
