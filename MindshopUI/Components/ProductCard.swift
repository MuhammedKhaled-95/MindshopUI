//
//  RoundedCorners.swift
//  MindshopUI
//
//  Created by Muhammed on 01/08/2021.
//
//
//  SplashScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 31/07/2021.
//

import SwiftUI

struct ProductCard: View {
    let Discount:Int
    let ProductName:String
    let Value:Int
    let ValueAfter:Int
    
    var body: some View {
        HStack {
            ZStack(content: {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                    HStack{
                        Spacer()
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                            Text("Disc").font(.caption).foregroundColor(Constants.bgColor).padding(.top, 5.0)
                            Text("\(Discount)%").font(.caption).bold().foregroundColor(Constants.bgColor)
                            ZStack {
                                Triangle()
                                    .fill(Color("SilverColor"))
                                    .frame(width: 40, height: 10)
                            }.frame(width: 40).background(Color("FBBA32"))
                        }).frame(width: 40).background(Color("FBBA32")).padding(.trailing, 5)
                    }
                    Spacer()
                    HStack {
                        Text(ProductName).font(.body)
                        Spacer()
                    }
                    HStack {
                        Text("$\(Value)").font(.body).bold()
                        Text("$\(ValueAfter)").font(.footnote).strikethrough().foregroundColor(Color("9A9A9A"))
                        Spacer()
                        Image(systemName: "heart")
                    }.padding(.bottom, 5)
                })
                .padding(.horizontal, 5.0)
                
            }).frame(width: 125, height: Constants.screenSize.height/5).background(Color("SilverColor"))
            .cornerRadius(10).shadow(color: Constants.fgColor.opacity(0.16),radius: 3)
        }
    }
}
struct ProductCardPreviews: PreviewProvider {
    static var previews: some View {

        ProductCard(Discount: 5, ProductName: "Nike bots", Value: 120, ValueAfter: 100)
        .previewDevice("iPhone 12")
    }
}
