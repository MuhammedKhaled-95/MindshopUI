//
//  SplashScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 31/07/2021.
//

import SwiftUI

struct ProfileScreen:View{
    @State var navigateStatePS=false
    @State var Navigateto=NavigatePage.myorder
    
    var body: some View{ 
            VStack(spacing: 0,content:{
                VStack(spacing: 10, content: {
                    CustomizedCircle(includeIMG: true, circleRadius:100, circleColor: Color("LightRed"),selectedImage: "person.circle",isSystemNamed:true)
                        .padding(.top,Constants.screenSize.height/7)
                    Text("Kylie")
                        .font(.title2).foregroundColor(Constants.fgColor)
                    Text("Kylie_04@gmail.com")
                        .font(.body).foregroundColor(Constants.fgColor)
                    
                })
                .frame(width:Constants.screenSize.width)
                .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .background(Color("SilverColor"))
                
                VStack(spacing: 10,content:{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15, content: {
                        ZStack {
                            ViewBottomRounded(roundedColor: "SilverColor", viewHeight: 60,corners:20)
                            NavigationLink(
                                "", destination:ZStack{
                                    if(Navigateto == NavigatePage.myorder){
                                        OrdersScreen()
                                    }else if(Navigateto == NavigatePage.settings){
                                        SettingsScreen()
                                    }else{
                                        AccountScreen()
                                    }
                                },
                                isActive: $navigateStatePS)
                            ProfileCard(btnText: "Account",selectedIcon: "person.circle", action: {
                                Navigateto=NavigatePage.account
                                navigateStatePS=true
                            })
                        }
                    })
                    ProfileCard(btnText: "My Order",selectedIcon: "list.bullet.rectangle", action: {
                        Navigateto=NavigatePage.myorder
                        navigateStatePS=true
                        
                    })
                    ProfileCard(btnText: "Settings",selectedIcon: "gearshape", action: {
                        Navigateto=NavigatePage.settings
                        navigateStatePS=true
                    })
                })
                Spacer()
            }).background(Constants.bgColor).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileScreenPreviews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .previewDevice("iPhone 12")
    }
}

