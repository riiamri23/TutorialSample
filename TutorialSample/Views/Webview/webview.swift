//
//  Webview.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI


struct Webview: View {
    
    @State private var isPresentWebView = false
    var body: some View {
        Button("Open WebView") {
            // 2
            isPresentWebView = true
            
        }
        .sheet(isPresented: $isPresentWebView) {
            NavigationStack {
                // 3
                WebView(url: URL(string: "https://sarunw.com")!)
                
                    .ignoresSafeArea()
                    .navigationTitle("Sarunw")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


#Preview("Webview") {
    Webview()
}
