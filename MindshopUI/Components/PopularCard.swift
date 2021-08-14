//
//  PopularCard.swift
//  MindshopUI
//
//  Created by Muhammed on 04/08/2021.
//

import SwiftUI

struct PopularCard: View {
    @State var isLinkActive=false
    let isLoading:Bool
    var body: some View {
        VStack(spacing: 5, content:{ 
            TextWithSpacer(text: isLoading ? "":"Popular", textFont: Font.title2.bold(), textColor: Constants.fgColor)
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: isLoading ? 20:10, content: {
                if(isLoading){
                    SkelatonView(width: Constants.screenSize.width/3, height: 100)
                    VStack(spacing: 20, content: {
                        HStack {
                            SkelatonView(width:150, height: 30)
                            Spacer()
                        }
                        HStack {
                            SkelatonView(width:100, height: 30)
                            Spacer()
                        }
                    })
                    Spacer()
                }else{
                    Rectangle().frame(width:  Constants.screenSize.width/3.5, height:  Constants.screenSize.height/6).foregroundColor(Color("SilverColor")).cornerRadius(15)
                    VStack( spacing: 10, content: {
                        if(!isLoading){
                            HStack {
                                Text("Vinta Backpack").font(Font.title3)
                                Spacer()
                            }
                            HStack {
                                Text("$78").font(Font.callout.bold())
                                Spacer()
                            }
                            StarswithRating(noOfStars: 5, rating: "4.9")
                        }
                    })
                }
                if(!isLoading){
                    VStack( spacing: 10, content: {
                        Image(systemName: "heart").font(.system(size: 20)).foregroundColor(Color("LightRed"))
                        ZStack(content: {
                            RoundedRectangle(cornerRadius: 15).frame(width: 60, height: 30).foregroundColor(Color("LightRed"))
                            Image(systemName: "cart").font(.system(size: 20)).foregroundColor(Constants.bgColor)
                            NavigationLink(
                                destination: MyCartScreen(),
                                isActive: $isLinkActive,
                                label: {
                                    ZStack{
                                        Button(action: {
                                            self.isLinkActive=true
                                        }, label: {
                                            Text(" ")
                                        })
                                    }
                                })
                        })
                    })
                }
                Spacer()
            })
        })
    }
}

struct StarswithRating: View {
    let noOfStars:Int
    let rating:String
    var body: some View {
        HStack(spacing: 10, content: {
            HStack(spacing: 0, content: {
                ForEach(0..<noOfStars) { item in
                    Image(systemName: "star.fill").font(.system(size: 12)).foregroundColor(Color("FBBA32"))
                }
            })
            Text(rating).font(Font.caption)
            Spacer()
        })
    }
}

struct HomeScreenasdasdPreviews: PreviewProvider {
    static var previews: some View {
        PopularCard(isLoading: false).previewDevice("iPhone 12 mini")
    }
}


