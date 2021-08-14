//
//  PaymentBottomCard.swift
//  MindshopUI
//
//  Created by Muhammed on 07/08/2021.
//

import SwiftUI

struct PaymentBottomCard: View {
    let textValue:String
    let costValue:Int
    let btnText:String
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 20,content:{
            HStack {
                Text(textValue).font(Font.callout.bold())
                Spacer()
                Text("$\(costValue)").foregroundColor(Color("LightRed")).font(Font.title2)
            }.frame(width: Constants.screenSize.width-80).padding(.top,20)
            BlackRoundedBtn(mainBtnText: btnText, btnWidth: Constants.screenSize.width-80, btnHeight: 50, mainColor: Color("LightRed"), textColor: Constants.bgColor, action: (self.action))
        }).frame(width:Constants.screenSize.width).padding(.bottom, 20).background(RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0).fill(Constants.bgColor))
    }
}

