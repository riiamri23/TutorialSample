//
//  TutorialSampleApp.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI
import SwiftData

@main
struct TutorialSampleApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(container)
    }
    
    
    init(){
        let schema = Schema([Book.self])
        let config = ModelConfiguration("MyBooks", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
//        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
//        do {
//            container = try ModelContainer(for:Book.self, configurations: config)
//        } catch {
//            fatalError("Could not configure the container")
//        }
            
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
//        print(URL.documentsDirectory.path())
    }
}
