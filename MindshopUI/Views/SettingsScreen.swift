//
//  SettingsScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 11/08/2021.
//

import SwiftUI

struct SettingsScreen:View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack{
        }
        .frame(width:Constants.screenSize.width,height:Constants.screenSize.height)
        .background(Color("SilverColor"))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Settings")
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        }))
        .foregroundColor(Constants.fgColor)
        .navigationBarBackButtonHidden(true)
    }
}
