//
//  EditBookView.swift
//  TutorialSample
//
//  Created by rii amri on 18/02/24.
//

import SwiftUI

struct EditBookView: View {
    @Environment(\.dismiss) private var dismiss
     let book: Book
    @State private var status = Status.onShelf
    @State private var rating: Int?
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var dateAdded = Date.distantPast
    @State private var dateStarted = Date.distantPast
    @State private var dateCompleted = Date.distantPast
    @State private var firstView = true
    
    var body: some View {
        HStack {
            Text("Status")
            Picker("Status", selection: $status){
                ForEach(Status.allCases) {
                    status in Text(status.descr).tag(status)
                }
            }.buttonStyle(.bordered)
        }
        VStack(alignment: .leading){
            GroupBox {
                LabeledContent {
                    DatePicker("", selection: $dateAdded, displayedComponents: .date)
                } label : {
                    Text("Date Added")
                }
                if status == .onProgress || status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateStarted, displayedComponents: .date)
                    } label : {
                        Text("Date Started")
                    }
                }
                if status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateCompleted, in: dateAdded..., displayedComponents: .date)
                    } label : {
                        Text("Date Completed")
                    }
                }
            }
            .foregroundColor(.secondary)
            .onChange(of: status){ oldValue, newValue in
                if !firstView{
                    if newValue == .onShelf {
                        dateStarted = Date.distantPast
                        dateCompleted = Date.distantPast
                    }else if newValue == .onProgress && oldValue == .completed {
                        // from completed to inProgress
                        dateCompleted = Date.distantPast
                    }else if newValue == .onProgress && oldValue == .onShelf {
                        dateStarted = Date.now
                    }else if newValue == .completed && oldValue == .onShelf {
                        dateCompleted = Date.now
                        dateStarted = dateAdded
                    }else {
                        dateCompleted = Date.now
                    }
                }
                firstView = false
                
            }
            Divider()
            LabeledContent{
                RatingsView(maxRating: 5, currentRating: $rating, width: 30)
            } label: {
                Text("Rating")
            }
            LabeledContent {
                TextField("", text: $title)
            } label : {
                Text("Title").foregroundStyle(.secondary)
                
            }
            LabeledContent {
                TextField("", text: $author)
            } label : {
                Text("Author").foregroundStyle(.secondary)
                
            }
            Divider()
            Text("Summary").foregroundStyle(.secondary)
            TextEditor(text: $summary)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if changed {
                Button("Update"){
                    book.status = status
                    book.rating = rating!
                    book.title = title
                    book.author = author
                    book.summary = summary
                    book.dateAdded = dateAdded
                    book.dateStarted = dateStarted
                    book.dateCompleted = dateCompleted
                    
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }.onAppear{
            status = book.status
            rating = book.rating
            title = book.title
            author = book.author
            summary = book.summary
            dateAdded = book.dateAdded
            dateStarted = book.dateStarted
            dateCompleted = book.dateCompleted
        }
    }
    
    var changed: Bool {
            status != book.status
            || rating != book.rating
            || title != book.title
            || author != book.author
            || summary != book.summary
            || dateAdded != book.dateAdded
            || dateStarted != book.dateStarted
            || dateCompleted != book.dateCompleted
    }
    
}

#Preview {
    let preview = Preview(Book.self)
    return NavigationStack {
        EditBookView(book: Book.sampleBooks[4])
    }
}
