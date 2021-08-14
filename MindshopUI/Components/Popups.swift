//
//  Popups.swift
//  MindshopUI
//
//  Created by Muhammed on 04/08/2021.
//

import SwiftUI

struct Popup3_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
            .previewDevice("iPod touch")
    }
    
    // Helper view that shows a popup
    struct Preview: View {
        @State var isPresented = false
        var body: some View {
            ZStack {
                Color.clear
                VStack {
                    Button("Show", action: { isPresented.toggle() }) 
                    Spacer()
                }
            }.modifier(Popup(isPresented: isPresented,
                             content: { ProductInfoPopup(action: ({
                                self.isPresented=false
                             }), IncludeDesc: true) }))
        }
    }
}

struct ConfirmationMsg: View {
    var action: () -> Void
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Spacer()
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                Color("DarkerSilver").cornerRadius(25).frame(width: 45, height: 5)
                Text("Confirm").font(Font.title2.bold()).foregroundColor(Constants.fgColor)
                Text("Are you sure you want to send this order?").font(Font.callout).foregroundColor(Constants.fgColor)
                BlackRoundedBtn(mainBtnText: "CONFIRM", btnWidth: 285,btnHeight:50,mainColor: Constants.fgColor ,textColor: Constants.bgColor, action: (self.action))
            }).frame(width: Constants.screenSize.width).padding(.vertical,20)
            .background(RoundedCorners(tl: 30, tr: 30, bl: 0 , br: 0).fill(Constants.bgColor))
        }).background(Color("57636F")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
struct OrderSuccessPop: View {
    var action: () -> Void
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Spacer()
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                CustomizedCircle(includeIMG: true, circleRadius: 60, circleColor:Color("8ED175"), selectedImage: "checkmark", isSystemNamed: true)
                Text("SUCCESS").font(Font.title2.bold())
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                    Text("Thank you for purchasing. We will contact").foregroundColor(Color("9A9A9A")).font(Font.callout)
                    Text("You as son as possible.").foregroundColor(Color("9A9A9A")).font(Font.callout)
                })
                BlackRoundedBtn(mainBtnText: "CONTINUE SHOPPING", btnWidth: 285,btnHeight:50,mainColor: Constants.fgColor ,textColor: Constants.bgColor, action: (self.action))
            }).frame(width: Constants.screenSize.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.vertical,20)
            .background(RoundedCorners(tl: 30, tr: 30, bl: 0 , br: 0).fill(Constants.bgColor))
        }).background(Color("57636F")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
