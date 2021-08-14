//
//  MyCartScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 07/08/2021.
//

import SwiftUI

struct MyCartScreen:View{
    @State var navigateState=false
    @State var OrdersInCart=MyCart.data
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack(spacing: 0,content:{
            ForEach(0..<OrdersInCart.count){i in
                SwipeItem(content: {
                    if(i<OrdersInCart.count){
                        ItemCard(noOfItems: 1, ItemCost: OrdersInCart[i].Price, ItemName: OrdersInCart[i].ItemName, ItemColor: OrdersInCart[i].Color, ItemSize: OrdersInCart[i].Size)
                    }
                }, right: {
                    if(i<OrdersInCart.count){
                        DeleteCardView(action: {
                            print("Delete the item here ")
                        })
                    }
                },itemHeight: Constants.screenSize.height/5)
            }
            Spacer()
            NavigationLink(
                destination: PaymentScreen(),
                isActive: $navigateState,
                label: {
                    PaymentBottomCard(textValue: "Subtotal", costValue: 0, btnText: "CHECKOUT", action: ({
                        print("CheckOut btn clicked")
                        self.navigateState=true
                    }))
                })
        }).padding(.top,10).edgesIgnoringSafeArea(.bottom).background(Color("DarkerSilver").opacity(0.4)).navigationBarTitle("My Cart", displayMode:.inline).navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })).foregroundColor(Constants.fgColor).navigationBarBackButtonHidden(true)
        
    }
}

struct MyCartScreenPreviews: PreviewProvider {
    static var previews: some View {
        MyCartScreen()
            .previewDevice("iPhone 12")
    }
}

struct ItemCard: View {
    @State var noOfItems:Int
    @State var ItemCost:Int
    @State var ItemName:String
    @State var ItemColor:String
    @State var ItemSize:String
    
    var body: some View {
        HStack( spacing: 0, content: {
            VStack{
                HStack {
                    Rectangle().frame(width:  Constants.screenSize.width/3.5, height:  Constants.screenSize.width/3.5).foregroundColor(Color("SilverColorV2")).cornerRadius(10)
                    VStack(spacing: 5, content: {
                        HStack{
                            TextWithSpacer(text: ItemName,textFont: Font.body.bold(), textColor: Color.black)
                            Button(action: {
                                print("I'll remove the item now")
                            }) {
                                Image(systemName: "trash").foregroundColor(Color("DarkerSilver"))
                            }
                        }
                        TextWithSpacer(text: "Color : \(ItemColor)",textFont: Font.caption, textColor: Color("9A9A9A"))
                        TextWithSpacer(text: "Size : \(ItemSize)", textFont: Font.caption, textColor: Color("9A9A9A"))
                        TextWithSpacer(text: "$\(ItemCost)", textFont: Font.body, textColor: Color.black)
                        HStack(spacing: 0, content: {
                            Button(action: {
                                self.noOfItems>0 ? (self.noOfItems-=1) : (self.noOfItems=0)
                            }) {
                                ZStack{
                                    ZStack{}.frame(width: 25, height: 20).background(RoundedCorners(tl: 5, tr: 0, bl: 5, br: 0).fill(Constants.fgColor))
                                    ZStack{}.frame(width: 23, height: 18).background(RoundedCorners(tl: 5, tr: 0, bl: 5, br: 0).fill(Constants.bgColor))
                                    Image(systemName: "minus").foregroundColor(Constants.fgColor)
                                }
                            }
                            ZStack{
                                Text("\(noOfItems)").foregroundColor(Constants.fgColor).font(Font.caption).bold()
                            }.frame(width: 30, height: 20).border(Constants.fgColor, width: 1)
                            Button(action: {
                                self.noOfItems+=1
                            }) {
                                ZStack{
                                    ZStack{}.frame(width: 25, height: 20).background(RoundedCorners(tl: 0, tr: 5, bl: 0, br: 5).fill(Constants.fgColor))
                                    ZStack{}.frame(width: 23, height: 18).background(RoundedCorners(tl: 0, tr: 5, bl: 0, br: 5).fill(Constants.bgColor))
                                    Image(systemName: "plus").foregroundColor(Constants.fgColor)
                                }
                            }
                            Spacer()
                        })
                        Spacer()
                    }).frame(height: Constants.screenSize.height/6-10)
                    Spacer()
                }
                Color("DarkerSilver").frame(width:Constants.screenSize.width-45, height: 0.5, alignment: .center)
                HStack {
                    Spacer()
                    Text("Sub Total  :  $\(self.noOfItems*self.ItemCost)").font(Font.subheadline).foregroundColor(Constants.fgColor)
                }
            }.padding(.horizontal,15)
        }).frame(height: Constants.screenSize.height/5-5).background(Constants.bgColor)
    }
}

struct DeleteCardView: View {
    var action: () -> Void
    var body: some View {
        ZStack{
            Button(action:self.action) {
                Image(systemName: "trash").foregroundColor(Constants.bgColor)
            }
        }.frame(width: 70,height: Constants.screenSize.height/5).background(Color("LightRed"))
    }
}
