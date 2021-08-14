//
//  SplashScreen.swift
//  MindshopUI
//
//  Created by Muhammed on 31/07/2021.
//

import SwiftUI

struct OnboardingScreen:View{
    let OnboardingData=Onboarding.data
    @State var navigateState=false
    @State var signUpPage=false
    @State var selectedTab = 1
    @State var currentPage=0
    
    var body: some View{
        NavigationView {
            VStack(spacing: 50,content: {
                CustomizedCircle(includeIMG: false, circleRadius:Constants.screenSize.width/2+50, circleColor: Color("SilverColor"),selectedImage: "person.circle",isSystemNamed:true).padding(.top,Constants.screenSize.height/8)
                Text(OnboardingData[currentPage].title).font(.title2)
                Text(OnboardingData[currentPage].desc).font(.subheadline).padding(.horizontal,50).multilineTextAlignment(.center)
                PaginationDots(currentPage: self.currentPage)
                Spacer()
                HStack {
                    Button( action:({
                        self.navigateState=true
                        self.signUpPage=false
                    }), label: {
                        Text("SKIP").font(.callout)
                    }).foregroundColor(Constants.fgColor)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 150, height: 50).foregroundColor(Color("LightRed"))
                        Button( action:({
                            if(currentPage<OnboardingData.count-1){
                                self.currentPage+=1
                            }else{
                                self.navigateState=true
                                self.signUpPage=false
                            }
                        }), label: { Text("NEXT").font(.callout).bold()}).foregroundColor(Constants.bgColor)
                    }
                }.padding(30)
            }).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
    
}

struct PaginationDots: View {
    var currentPage:Int
    var body: some View {
        HStack {
            switch currentPage {
            case 0:
                RoundedRectangle(cornerRadius: 25).frame(width: 24  , height: 7).foregroundColor(Color("LightRed"))
                CustomizedCircle(includeIMG: false, circleRadius:7, circleColor: Color("DarkerSilver"),selectedImage: "",isSystemNamed:true)
                CustomizedCircle(includeIMG: false, circleRadius:7, circleColor: Color("DarkerSilver"),selectedImage: "",isSystemNamed:true)
            case 1:
                CustomizedCircle(includeIMG: false, circleRadius:7, circleColor: Color("DarkerSilver"),selectedImage: "",isSystemNamed:true)
                RoundedRectangle(cornerRadius: 25).frame(width: 24  , height: 7).foregroundColor(Color("LightRed"))
                CustomizedCircle(includeIMG: false, circleRadius:7, circleColor: Color("DarkerSilver"),selectedImage: "",isSystemNamed:true)
            default:
                CustomizedCircle(includeIMG: false, circleRadius:7, circleColor: Color("DarkerSilver"),selectedImage: "",isSystemNamed:true)
                CustomizedCircle(includeIMG: false, circleRadius:7, circleColor: Color("DarkerSilver"),selectedImage: "",isSystemNamed:true)
                RoundedRectangle(cornerRadius: 25).frame(width: 24  , height: 7).foregroundColor(Color("LightRed"))
            }
        }
    }
}

struct OnboardingScreenPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
            .previewDevice("iPhone 12")
    }
}
