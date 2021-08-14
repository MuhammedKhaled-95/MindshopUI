//
//  AppConfig.swift
//  MindshopUI
//
//  Created by Rene van der Kooi on 24/7/2564 BE.
//
import SwiftUI
import Foundation
import FirebaseFirestoreSwift
import Firebase

struct AppConfig: Codable {
    var offline: Int
    var offlineMessage: String
    var colorPrimary: String // this should be Color (could map with extention.)
    var colorScheme: Status // this maps all screens to the color scheme.
    
    enum CodingKeys: String, CodingKey {
        case offline = "offline"
        case offlineMessage = "offlineMessage"
        case colorPrimary = "colorPrimary"
        case colorScheme = "colorScheme"
    }
    
    public func getBgColor() -> Color {
        switch colorScheme {
        case .dark:
            return Color("colorDarkFg")
        case .light:
            return Color("colorDarkBg")
        default:
            return Color("colorDarkFg")
        }
    }
    
    public func getFgColor() -> Color {
        switch colorScheme {
        case .dark:
            return Color("colorDarkBg")
        case .light:
            return Color("colorDarkFg")
        default:
            return Color("colorDarkBg")
        }
    }
}

enum Status: String, Codable {
    case dark
    case light
    case auto
    
    enum CodingKeys: String, CodingKey {
        case dark = "dark"
        case light = "light"
        case auto = "auto"
    }
}
