//
//  Crudbook.swift
//  TutorialSample
//
//  Created by rii amri on 18/02/24.
//

import SwiftUI
import SwiftData


struct Crudbook: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .padding()
        .navigationTitle("My Books")
        .toolbar{
            Button {
                
            }label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
            }
        }
    }
}
