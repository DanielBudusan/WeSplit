//
//  Book.swift
//  BookWorm
//
//  Created by Daniel Budusan on 11.03.2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateAdded: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int, dateAdded: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateAdded = dateAdded
    }
}

