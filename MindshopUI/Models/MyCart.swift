//
//  MyCart.swift
//  MindshopUI
//
//  Created by Muhammed on 13/08/2021.
//

import Foundation
import FirebaseFirestoreSwift

struct MyCart: Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var OrderID: String
    var ItemName: String
    var Color:String
    var Size:String
    var Price:Int
    
    enum CodingKeys: String, CodingKey {
        case OrderID = "OrderID"
        case ItemName = "ItemName"
        case Color = "Color"
        case Size = "Size"
        case Price = "Price"
    }
    
    init(OrderID: String, ItemName: String, Color: String,Size: String,Price: Int) {
        self.OrderID = OrderID
        self.ItemName = ItemName
        self.Color = Color
        self.Size = Size
        self.Price = Price
    }
}

extension MyCart {
    static var data: [MyCart] {
        [
            MyCart(OrderID: "Order 11100001", ItemName: "Levi's Jeans", Color: "Dark Grey", Size: "L", Price: 76),
            MyCart(OrderID: "Order 11100001", ItemName: "Nike Airmax", Color: "Red/White", Size: "M", Price:206),
            MyCart(OrderID: "Order 11100001", ItemName: "Adidas M", Color: "Grey", Size: "S", Price: 150)
        ]
    }
}
