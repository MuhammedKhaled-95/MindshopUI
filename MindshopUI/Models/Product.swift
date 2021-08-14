//
//  Product.swift
//  MindshopUI
//
//  Created by Rene van der Kooi on 25/7/2564 BE.
//

import Foundation
import FirebaseFirestoreSwift

struct Product: Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var categoryID: String
    var title: String
    var desc: String
    var price: Int
    var afterprice: Int
    var descvalue:Int
    var authorId: String
    var options: [ProductOptions]?
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryID"
        case title = "title"
        case desc = "desc"
        case price = "price"
        case afterprice = "afterprice"
        case descvalue = "descvalue"
        case authorId = "authorId"
        case options = "options"
    }

    init(id: String, categoryID: String, title: String, desc: String, authorId: String, price: Int,afterprice:Int,descvalue:Int) {
        self.id = id
        self.categoryID = categoryID
        self.title = title
        self.desc = desc
        self.price = price
        self.descvalue = descvalue
        self.authorId = authorId
        self.afterprice=afterprice
    }
}

struct ProductOptions: Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var values: [String]?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case values = "values"
    }
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}


extension Product {
    static var data: [Product] {
        [
            Product(id: "1", categoryID: "1", title: "Nike Airmax", desc: "Lorum Ipsum", authorId: "0000-0000-0000-0000", price: 100, afterprice: 86, descvalue: 20),
            Product(id: "2", categoryID: "1", title: "Nike Air Woman", desc: "Lorum Ipsum", authorId: "0000-0000-0000-0000", price: 200, afterprice: 120, descvalue: 40),
            Product(id: "3", categoryID: "1", title: "Adidas M", desc: "Lorum Ipsum", authorId: "0000-0000-0000-0000", price: 300, afterprice: 220, descvalue: 30)
        ]
    }
}
