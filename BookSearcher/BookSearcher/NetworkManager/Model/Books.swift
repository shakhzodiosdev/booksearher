//
//  Book.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import Foundation



struct Books: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let volumeInfo: Book
}

struct Book  : Decodable {
    let title : String?
    let authors : [String]?
    let description : String?
    let imageLinks : ImageLinks
}


struct ImageLinks : Decodable {
    let thumbnail : String?
    let smallThumbnail : String?
}

