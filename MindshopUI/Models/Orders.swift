//
//  Orders.swift
//  MindshopUI
//
//  Created by Muhammed on 10/08/2021.
// 

import Foundation
import FirebaseFirestoreSwift

struct Orders: Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var OrderID: String
    var OrderState: String
    var isPending:Bool
    
    enum CodingKeys: String, CodingKey {
        case OrderID = "OrderID"
        case OrderState = "OrderState"
        case isPending = "isPending"
    }
    
    init(OrderID: String, OrderState: String, isPending: Bool) {
        self.OrderID = OrderID
        self.OrderState = OrderState
        self.isPending = isPending
    }
}

extension Orders {
    static var data: [Orders] {
        [
            Orders(OrderID: "Order 11100001", OrderState: "Waiting at customs", isPending: true),
            Orders(OrderID: "Order 00000121", OrderState: "Has been shipped", isPending: false),
            Orders(OrderID: "Order 00120011", OrderState: "Has been delivered", isPending: false),
            Orders(OrderID: "Order 01002311", OrderState: "Waiting at customs", isPending: true)
        ]
    }
}
