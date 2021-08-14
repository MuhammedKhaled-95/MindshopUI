//
//  Category.swift
//  MindshopUI
//
//  Created by Rene van der Kooi on 25/7/2564 BE.
//

import Foundation
import FirebaseFirestoreSwift

struct Category: Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var authorId: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case authorId = "authorId"
    }

    init(id: String, title: String, authorId: String) {
        self.id = id
        self.title = title
        self.authorId = authorId
    }
}

extension Category {
    static var data: [Category] {
        [
            Category(id: "1", title: "Shoes", authorId: "0000-0000-0000-0000"),
            Category(id: "2", title: "Trousers", authorId: "0000-0000-0000-0000"),
            Category(id: "3", title: "Skirts", authorId: "0000-0000-0000-0000"),
            Category(id: "4", title: "Eyewear", authorId: "0000-0000-0000-0000")
        ]
    }
}
