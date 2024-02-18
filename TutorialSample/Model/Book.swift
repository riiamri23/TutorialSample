//
//  Book.swift
//  TutorialSample
//
//  Created by rii amri on 18/02/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Book {
    var title: String
    var author: String
    var dateAdded: Date
    var dateStarted: Date
    var dateCompleted: Date
    var summary: String
    var rating: Int?
    var status: Status
    
    init(
        title: String,
        author: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        summary: String = "",
        rating: Int? = nil,
        status: Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.summary = summary
        self.rating = rating
        self.status = status
    }
    
    
    var icon: Image {
        switch status {
        case .onShelf:
            Image(systemName: "checkmark.diamond.fill")
        case .onProgress:
            Image(systemName: "book.fill")
        case .completed:
            Image(systemName: "book.closed")
        }
    }
}

enum Status: Int, Codable, Identifiable, CaseIterable {
    case onShelf, onProgress, completed
    
    var id: Self {
        self
    }
    
    var descr: String {
        switch self {
            case .onShelf:
                "On Shelf"
            case .onProgress:
                "On Progress"
            case .completed:
                "completed"
        }
    }
}
