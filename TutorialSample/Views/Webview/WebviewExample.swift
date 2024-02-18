//
//  WebviewExample.swift
//  TutorialSample
//
//  Created by rii amri on 17/02/24.
//

import SwiftUI

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    // 1
    let url: URL

    
    // 2
    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebviewExample: View {
    
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



#Preview("WebviewExample") {
    WebviewExample()
}
