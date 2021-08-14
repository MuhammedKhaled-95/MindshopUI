//
//  OrdersScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 10/08/2021.
//

import SwiftUI

struct OrdersScreen:View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack(spacing: 0,content:{
            VStack(spacing: 0,content:{
                ForEach(0..<Orders.data.count){ i in
                    OrderCard(OrderNo: Orders.data[i].OrderID, OrderState: Orders.data[i].OrderState, isPending: Orders.data[i].isPending)
                }
            }).shadow(color: Constants.fgColor.opacity(0.05),radius: 3)
            Spacer()
        }).padding(.top,20).frame(width:Constants.screenSize.width).background(Color("SilverColor")).edgesIgnoringSafeArea(.bottom).navigationBarTitle("Orders").navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        }))
        .foregroundColor(Constants.fgColor).navigationBarBackButtonHidden(true)
    }
}

struct OrderCard: View {
    let OrderNo:String
    let OrderState:String
    let isPending:Bool
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
            CustomizedCircle(includeIMG: false, circleRadius: 25, circleColor: Color.random(), selectedImage: "", isSystemNamed: false).padding(.bottom,10)
            VStack( spacing: 5, content: {
                TextWithSpacer(text: OrderNo, textFont: Font.caption.bold(), textColor: Constants.fgColor)
                TextWithSpacer(text: OrderState,textFont: Font.caption2, textColor: Color("9A9A9A"))
            })
            Spacer()
            if(isPending){
                ZStack{
                    Text("Pending").foregroundColor(Constants.bgColor).font(Font.caption).padding(.trailing,30)
                }.frame(width: 90, height: 30).background(RoundedCorners(tl: 15, tr: 0, bl:15, br: 0).fill(Color("FBBA32"))).padding(.bottom,10)
            }
        }).padding(.leading,10).frame(width:Constants.screenSize.width-30, height:60).background(Constants.bgColor)
    }
}
struct OrdersScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrdersScreen()
    }
}
