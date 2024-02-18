//
//  TutorialSampleApp.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI

@main
struct TutorialSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Book.self)
    }
    
    
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
