//
//  Constants.swift
//  MindshopUI
//
//  Created by Muhammed on 31/07/2021.
//
 
import SwiftUI


struct Constants {
    static let generateText="Lorem ipsum dolor sit amet,Consectetur adipiscing elit. Interger Maximus accumsan erat ide facilisis."
    static let longerText="\(Constants.generateText) Duis aute irure dolor in reprehenderit in voluptate velit."
    static let screenSize=UIScreen.main.bounds
    static let bgColor = (ConfigHelper.shared().appConfig?.getBgColor()) ?? Color.white
    static let fgColor = (ConfigHelper.shared().appConfig?.getFgColor()) ?? Color.black
}

enum PageState:String{
    case forgetpass,signup,signin
}
enum NavigatePage:String{
    case account,myorder,settings
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(), green: .random(), blue: .random())
    }
}
extension Double {
    static func random() -> Double {
        return Double(arc4random()) / Double(UInt32.max)
    }
}
