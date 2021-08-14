//
//  MyCartScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 07/08/2021.
//

import SwiftUI

struct PaymentScreen:View{
    @State var isconfirm = false
    @State var issuccesfully = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack( spacing:0, content: {
                    ShippingAddressCard()
                    OrderInfoCard()
                    DeliverInfoCard()
                    DescriptionCard()
                    PaymentMethodCard()
                })
            })
            Spacer()
            PaymentBottomCard(textValue: "Total", costValue: 154, btnText: "BUY NOW", action: ({
                self.isconfirm=true
            }))
        }.edgesIgnoringSafeArea(.bottom).background(Color("DarkerSilver").opacity(0.4))
        .modifier(Popup(isPresented: issuccesfully,content: { OrderSuccessPop(action: {self.issuccesfully=false}) }))
        .modifier(Popup(isPresented: isconfirm, content: { ConfirmationMsg(action: {
            self.isconfirm=false
            self.issuccesfully=true
        }) })).navigationBarTitle("Payment & Shipping").navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })).foregroundColor(.black).navigationBarBackButtonHidden(true)
    }
}

struct PaymentScreenPreviews: PreviewProvider {
    static var previews: some View {
        PaymentScreen()
            .previewDevice("iPhone 12 mini")
    }
}

struct ShippingAddressCard: View {
    var body: some View {
        VStack(spacing: 5, content: {
            HStack( spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Image("location").resizable().frame(width: 20, height: 20)
                TextWithSpacer(text: "Shipping Address", textFont: Font.caption, textColor: Constants.fgColor)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit").font(Font.caption).foregroundColor(Constants.fgColor)
                })
            }).padding(.horizontal,20).padding(.vertical,10)
            Color("DarkerSilver").frame(width:Constants.screenSize.width-40, height: 0.5, alignment: .center)
            VStack {
                TextWithSpacer(text: "Kylie",  textFont: Font.title2.bold(), textColor: Constants.fgColor)
                TextWithSpacer(text: "California Street, Blok 4F No.9",textFont:Font.caption, textColor: Constants.fgColor)
                TextWithSpacer(text: "San Fransisco",textFont:Font.caption, textColor: Constants.fgColor)
                TextWithSpacer(text: "California",textFont:Font.caption, textColor: Constants.fgColor)
                TextWithSpacer(text: "0214-0000-0000", textFont:Font.caption, textColor: Constants.fgColor)
            }.padding(.horizontal,40).padding(.vertical,10)
        }).background(Constants.bgColor).padding(.top,10)
    }
}

struct OrderInfoCard: View {
    var body: some View {
        VStack(spacing: 5, content: {
            HStack( spacing: 0, content: {
                Rectangle().frame(width:  Constants.screenSize.width/5, height:  Constants.screenSize.width/5).foregroundColor(Color("SilverColorV2")).cornerRadius(5).padding()
                VStack(spacing: 5, content: {
                    TextWithSpacer(text: "Levi’s Jeans", textFont:Font.subheadline, textColor: Constants.fgColor)
                    TextWithSpacer(text: "Color : Dark Grey | Size : L", textFont:Font.caption, textColor: Color("9A9A9A"))
                    HStack {
                        TextWithSpacer(text: "$76",textFont:Font.callout, textColor: Constants.fgColor)
                        Text("x2").foregroundColor(Color("9A9A9A"))
                            .font(Font.callout)
                    }.padding(.trailing,30)
                })
                Spacer()
            })
        }).frame(width: Constants.screenSize.width).background(Constants.bgColor).padding(.top,10)
    }
}

struct DeliverInfoCard: View {
    var body: some View {
        VStack(spacing: 5, content: {
            HStack( spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                TextWithSpacer(text: "Delivery Service",textFont:Font.caption, textColor: Constants.fgColor)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit").font(Font.caption).foregroundColor(Color("9A9A9A"))
                })
            }).padding(.horizontal,20).padding(.vertical,10)
            Color("DarkerSilver").frame(width:Constants.screenSize.width-40, height: 0.5, alignment: .center)
            HStack( spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                TextWithSpacer(text: "Standard Delivery",textFont:Font.caption.bold(), textColor: Constants.fgColor)
                Text("$2").font(Font.caption.bold()).foregroundColor(Constants.fgColor)
            }).padding(.horizontal,20).padding(.vertical,10)
        }).background(Constants.bgColor).padding(.top,10)
    }
}

struct DescriptionCard: View {
    var body: some View {
        VStack(spacing: 5, content: {
            TextWithSpacer(text: "Add Description", textFont:Font.caption.bold(), textColor: Color.black).padding(.horizontal,20).padding(.vertical,10)
            ZStack{
            }.frame(width: Constants.screenSize.width-40, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).overlay(RoundedRectangle(cornerRadius: 10).stroke(Constants.fgColor,lineWidth: 0.5)).padding(.bottom,20)
        }).background(Constants.bgColor).padding(.top,10)
    }
}

struct PaymentMethodCard: View {
    var body: some View {
        VStack(spacing: 5, content: {
            HStack{
                TextWithSpacer(text: "Payment Method",textFont:Font.caption.bold(), textColor: Constants.fgColor)
                Image("location").resizable().frame(width: 20, height: 20)
                Text("Cash").foregroundColor(Constants.fgColor).font(Font.caption.bold())
                ZStack {
                    Circle().frame(width:20 , height: 20).foregroundColor(Constants.fgColor)
                    Image(systemName: "chevron.forward").font(.system(size: 12)).foregroundColor(Constants.bgColor)
                }}.padding(.horizontal,20).padding(.vertical,10)
            Color("DarkerSilver").frame(width:Constants.screenSize.width-40, height: 0.5, alignment: .center)
            
            HStack{
                TextWithSpacer(text: "Subtotals for products",textFont:Font.caption, textColor: Color("9A9A9A"))
                Text("$152").font(Font.caption).foregroundColor(Color("9A9A9A"))
            }.padding(.horizontal,20).padding(.vertical,5)
            
            HStack{
                TextWithSpacer(text: "Subtotals for shipping",textFont:Font.caption, textColor: Color("9A9A9A"))
                Text("$2").font(Font.caption).foregroundColor(Color("9A9A9A"))
            }.padding(.horizontal,20).padding(.vertical,5)
            
            HStack{
                TextWithSpacer(text: "Total Payment",textFont:Font.caption.bold(), textColor: Constants.fgColor)
                Text("$154").font(Font.caption.bold()).foregroundColor(Constants.fgColor)
            }.padding(.horizontal,20).padding(.vertical,10)
        }).background(Constants.bgColor).padding(.top,10)
    }
}
