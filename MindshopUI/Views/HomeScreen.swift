//
//  SplashScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 31/07/2021.
//

import SwiftUI

struct HomeScreen:View{
    @State var searchText:String
    @State var selectedBTN:Int
    @State var containOrders=false
    @State var isLoading=true
    @State var isPresented = false
    let Categories=Category.data
    
    var body: some View{
        ZStack{
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0,content:{
                    VStack(spacing: 20, content: {
                        ZStack {
                            HStack {
                                Image(systemName: "magnifyingglass").font(Font.headline.bold()).foregroundColor(Constants.fgColor).padding(.leading,10)
                                TextField(
                                    "Search...",
                                    text: $searchText
                                ).font(Font.headline)
                            }
                        }.frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Constants.bgColor).cornerRadius(25)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Constants.fgColor.opacity(0.12),lineWidth: 1)).padding(.top,10)
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack {
                                ForEach(0..<Categories.count){i in
                                    BlackRoundedBtn(mainBtnText: Categories[i].title, btnWidth:90,btnHeight: 40,mainColor: selectedBTN != i ? Constants.bgColor : Constants.fgColor ,textColor: selectedBTN != i ? Color.black : Color.white , action: {selectedBTN=i})
                                }
                            }
                        }).padding(.bottom, 10)
                    }).padding(.horizontal,20).background(Color("SilverColor"))
                    ZStack {
                        ViewBottomRounded(roundedColor: "SilverColor", viewHeight: Constants.screenSize.height/12,corners:30)
                        if(containOrders){
                            VStack {
                                HStack {
                                    Image("Wallet").resizable().frame(width: 20, height: 20)
                                    VStack(spacing:0,content: {
                                        HStack {
                                            Text("Order NX00219288391")
                                                .font(Font.callout.bold()).foregroundColor(Constants.bgColor)
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Has been shipped").font(Font.caption).foregroundColor(Constants.bgColor)
                                            Spacer()
                                        }
                                    })
                                }
                                HStack {
                                    Circle().frame(width: 5, height: 5).foregroundColor(Constants.bgColor)
                                    Circle().frame(width: 5, height: 5).foregroundColor(Constants.bgColor)
                                    Circle().frame(width: 5, height: 5).foregroundColor(Constants.bgColor)
                                }
                            }.padding(.horizontal, 20.0).padding(.vertical,10).frame(width: Constants.screenSize.width-40).background(Color("LightRed")).cornerRadius(10)
                        }else{
                            HStack {
                                Image("Wallet").resizable().frame(width: 20, height: 20)
                                Text("No Pending orders").font(Font.caption.bold()).foregroundColor(Constants.bgColor)
                            }.frame(width: Constants.screenSize.width-40, height: Constants.screenSize.height/15).background(Color("LightRed")).cornerRadius(10)
                        }
                        
                    }
                    .padding(.bottom, 10.0)
                    VStack(spacing:20,content: {
                        VStack(spacing: 5, content: {
                            TextWithSpacer(text: isLoading ? "":"Sale Discount", textFont: Font.title2.bold(), textColor: Constants.fgColor)
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack(spacing: isLoading ? 20:10, content: {
                                    let Products=Product.data
                                    ForEach(0..<Products.count) { i in
                                        if(!isLoading){
                                            ProductCard(Discount: Products[i].descvalue, ProductName: Products[i].title, Value: Products[i].afterprice, ValueAfter: Products[i].price).onTapGesture {
                                                isPresented=true
                                            }
                                        }else{
                                            SkelatonView(width: 100, height: Constants.screenSize.height/5)
                                        }
                                    }
                                })
                                .padding([.horizontal,.vertical], 5.0)
                            })
                        })
                        PopularCard(isLoading: self.isLoading)
                    }).padding(.leading, 20.0)
                    Spacer()
                })
            })
        }.modifier(Popup(isPresented: isPresented,content: { ProductInfoPopup(action: ({ self.isPresented=false }), IncludeDesc: true) })).edgesIgnoringSafeArea(.bottom).onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                isLoading = false
                containOrders=true
            })
        })
    }
}

struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen(searchText: "", selectedBTN: 1)
        }
        .previewDevice("iPhone 12")
    }
}
