//
//  Onboarding.swift
//  MindshopUI
//
//  Created by Rene van der Kooi on 25/7/2564 BE.
//

import Foundation
import FirebaseFirestoreSwift

struct Onboarding: Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var desc: String
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case desc = "desc"
        case imageUrl = "imageUrl"
    }

    init(id: String, title: String, desc: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.desc = desc
        self.imageUrl = desc
    }
}

extension Onboarding {
    static var data: [Onboarding] {
        [
            Onboarding(id: "1", title: "TITLE 1", desc: Constants.generateText, imageUrl: "https://via.placeholder.com/300"),
            Onboarding(id: "2", title: "TITLE 2", desc: "Lorum Ipsum", imageUrl: "https://via.placeholder.com/300"),
            Onboarding(id: "3", title: "TITLE 3", desc: "Lorum Ipsum", imageUrl: "https://via.placeholder.com/300")
        ]
    }
}
