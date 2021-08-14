//
//  ProductInfoPopup.swift
//  MindshopUI
//
//  Created by Muhammed on 09/08/2021.
//

import SwiftUI

struct Popup4_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductInfoPopup(action: ({}), IncludeDesc: true)
            .previewDevice("iPod touch")
    }
}

struct ProductInfoPopup: View {
    var action: () -> Void
    @State var noOfItems: Int = 1
    @State var costOfItem:Int = 97
    let IncludeDesc: Bool
    let longerText = Constants.generateText
    var Colors = [Constants.fgColor, Constants.bgColor, Constants.bgColor]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Spacer()
            HStack {
                Spacer()
                ForEach(0..<Colors.count) { i in
                    CustomizedCircle(includeIMG: false, circleRadius: 5, circleColor: Colors[i], selectedImage: "", isSystemNamed: false)
                }
                Spacer()
                Image(systemName: "heart").foregroundColor(Constants.bgColor)
            }.padding(.horizontal,30)
            VStack( spacing: 10, content: {
                Color("DarkerSilver").cornerRadius(25).frame(width: 45, height: 5) 
                TextWithSpacer(text: "Orange Summer",textFont: Font.title3.bold(), textColor: Color.black)
                HStack {
                    StarswithRating(noOfStars: 5, rating: "4.9")
                    Spacer()
                    Text("$\(costOfItem*noOfItems)").font(Font.custom("Nunito-Bold", size: 20))
                }
                SizeElement()
                ColorElement()
                QualityElement(noOfItems: noOfItems, costOfItem: costOfItem)
                if(IncludeDesc){
                    TextWithSpacer(text: "Description",textFont: Font.caption.bold(), textColor: Color.black)
                    TextWithSpacer(text: "\(longerText) \(longerText)",textFont: Font.caption, textColor: Color("9A9A9A")).lineLimit(3)
                }
                BlackRoundedBtn(mainBtnText: "ADD TO CART", btnWidth: 285,btnHeight:50,mainColor: Constants.fgColor ,textColor: Constants.bgColor, action:(self.action))
            }).padding(.bottom,100).padding(.horizontal,30).padding(.top,10).frame(width: Constants.screenSize.width)
            .background(RoundedCorners(tl: 30, tr: 30, bl: 0 , br: 0).fill(Constants.bgColor))
        }).background(Color("57636F").opacity(0.9)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct QualityElement: View {
    @State var noOfItems:Int
    @State var costOfItem:Int
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
            TextWithSpacer(text: "Select Quality :", textFont: Font.caption.bold(), textColor: Constants.fgColor)
            Button(action: {
                self.noOfItems>0 ? (self.noOfItems-=1) : (self.noOfItems=0)
            }) {
                Image(systemName: "minus").frame(width: 20, height: 20).foregroundColor(Constants.fgColor).padding(5)
            }.background(Color("SilverColor")).cornerRadius(5)
            ZStack{
                Text("\(noOfItems)").foregroundColor(Color.black).font(Font.caption.bold())
            }.frame(width: 55, height: 20).padding(5).background(Color("SilverColor")).cornerRadius(5)
            Button(action: {
                self.noOfItems+=1
            }) {
                Image(systemName: "plus").frame(width: 20, height: 20).foregroundColor(Constants.fgColor).padding(5)
            }.background(Color("SilverColor")).cornerRadius(5)
        })
    }
}

struct SizeElement: View {
    var Items=["S","M","L","XL"]
    @State var selectedSize:Int=1
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
            TextWithSpacer(text: "Size :", textFont:Font.caption.bold(), textColor: Constants.fgColor)
            ForEach(0..<Items.count) { i in
                Button(action: {
                    self.selectedSize=i
                }) {
                    Text("\(Items[i])").foregroundColor(self.selectedSize==i ? Constants.bgColor : Constants.fgColor)
                        .font(Font.caption.bold())
                }.frame(width: 20, height: 20).padding(5).background(self.selectedSize==i ? Constants.fgColor: Color("SilverColor")).cornerRadius(5)
            }
        })
    }
}
struct ColorElement: View {
    var Colors=[Color("FF809F"),Color("LightRed"),Color("C7DC5B"),Color("FED883")]
    @State var selectedColor:Int=1
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
            TextWithSpacer(text: "Choose a color :", textFont:Font.caption.bold(), textColor:Constants.fgColor)
            ForEach(0..<Colors.count) { i in
                Button(action: {
                    self.selectedColor=i
                }) {
                    if(self.selectedColor == i){
                        ZStack{
                            Circle().strokeBorder(Color.black,lineWidth: 0.2).frame(width: 25, height: 25).foregroundColor(Color("SilverColor"))
                            CustomizedCircle(includeIMG: false, circleRadius: 20, circleColor: Colors[i], selectedImage: "", isSystemNamed: false).padding(5)
                        }
                    }else{
                        CustomizedCircle(includeIMG: false, circleRadius: 20, circleColor: Colors[i], selectedImage: "", isSystemNamed: false).padding(5)
                    }
                } 
            }
        })
    }
}
