//
//  customizedViews.swift
//  MindshopUI
//
//  Created by Muhammed on 31/07/2021.
//

import SwiftUI


struct ProfileCard: View {
    let btnText:String
    let selectedIcon:String
    var action: () -> Void
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
            Image(systemName: selectedIcon).font(.title2).padding(.leading,20).foregroundColor(Constants.fgColor)
            Button( action:(self.action), label: {
                Text(btnText).font(.body).bold().foregroundColor(Constants.fgColor)
            })
            .foregroundColor(Constants.fgColor)
            Spacer()
        }).frame(width:Constants.screenSize.width-70, height:60).background(Constants.bgColor).cornerRadius(10)
        .shadow(color: Color("SpaceGray"),radius: 2)
    }
}

struct TextWithSpacer: View {
    let text:String
    let textFont:Font
    let textColor:Color
    
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(textColor)
                .font(textFont)
            Spacer()
        }
    }
}

struct CustomizedCircle: View {
    let includeIMG:Bool
    let circleRadius:CGFloat
    let circleColor:Color
    let selectedImage:String
    let isSystemNamed:Bool
    var body: some View {
        if(includeIMG){
            if(isSystemNamed){
                ZStack {
                    Circle().frame(width:circleRadius , height: circleRadius).foregroundColor(circleColor)
                    Image(systemName: selectedImage).font(.system(size: 40)).foregroundColor(Color.white)
                }
            }else{
                ZStack {
                    Circle().frame(width:circleRadius , height: circleRadius).foregroundColor(circleColor)
                    Image(selectedImage)
                }
            }
        }else{
            Circle().frame(width: circleRadius, height: circleRadius).foregroundColor(circleColor)
        }
    }
}

struct CustomizedTextField: View {
    @State var mainMsg:String
    @State var selectedImg:String="eye.slash.fill"
    let placeHolder:String
    let pwField:Bool
    @State var togglePW:Bool=false
    
    var body: some View {
        HStack { 
            ZStack{
                if pwField{
                    HStack(spacing: 0, content: {
                        if(self.togglePW){
                            SecureField(
                                "",
                                text: $mainMsg
                            )
                        }else{
                            TextField(
                                placeHolder,
                                text: $mainMsg
                            ).font(.body)
                        }
                        ZStack {
                            Image(systemName:selectedImg).font(.system(size: 20)).foregroundColor(Color("DarkerSilver"))
                            Button(" ", action: {
                                selectedImg = togglePW ?   "eye.slash.fill" : "eye"
                                self.togglePW = !self.togglePW
                            })
                        }
                    })
                    .padding(.horizontal, 15)
                }else{
                    TextField(
                        placeHolder,
                        text: $mainMsg
                    ).font(.body)
                    .frame(width: 285).padding(.leading,30)
                }
            }
        }.frame(width: 285, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color("SilverColor")).cornerRadius(25)
    }
}

struct BlackRoundedBtn:View{
    var mainBtnText:String
    var btnWidth:CGFloat
    var btnHeight:CGFloat
    var mainColor:Color
    var textColor:Color
    var action: () -> Void
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: btnWidth, height: btnHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(mainColor)
            Button( action:(self.action), label: {
                Text(mainBtnText)
                    .font(.caption)
                    .fontWeight(.bold)
            }).foregroundColor(textColor)
        }
    }
}

struct CircleSystemNamed:View{
    let Radius:CGFloat
    let CircleColor:String
    let Icon:String
    let IconSize:CGFloat
    var body: some View{
        ZStack{
            Circle().frame(width:Radius , height: Radius).foregroundColor(Color(CircleColor))
            Image(systemName: Icon).font(.system(size: IconSize).bold())
        }
        
    }
}


struct SkelatonView:View {
    let width:CGFloat
    let height:CGFloat
    var body: some View{
        ZStack{
            
        }.frame(width: width, height: height).background(Color("SilverColor"))
        .cornerRadius(10).shadow(color: Color.black.opacity(0.16),radius: 3)
    }
}

struct CustomizedWidgetPreviews: PreviewProvider {
    var selectedBTN:Int=1
    static var previews: some View { 
        VStack {
            /// ------- font samples --------
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack { 
                    /// --------- color sample -------
//                    BlackRoundedBtn(mainBtnText: "Shoes shoes hoes heos hoes hoes", /// <-------- THIS IS AN ISSUE
//                                    btnWidth: 90, btnHeight: 40, mainColor:(ConfigHelper.shared().appConfig?.getBgColor()) ?? Color.black , textColor:(ConfigHelper.shared().appConfig?.getFgColor()) ?? Color.black , action: {})
                    Text("caption").font(.caption)
                    Text("caption bold").font(.caption).bold()
                    
                    Text("callout").font(.callout)
                    Text("callout bold").font(.callout).bold()
                    
                    Text("body").font(.body)
                    Text("body bold").font(.body).bold()
                    //
                    //                     Text("title").font(.title)
                    //                     Text("title bold").font(.title).bold()
                    //                    Button(action: {
                    //                    }) {
                    //                        Image(systemName: "plus").frame(width: 15, height: 10).foregroundColor(Color.black).padding(5)
                    //                    }.border(Color.black, width: 1).cornerRadius(5)
                    
                    //
                    
                    
                    
                    
                    /*  
                     Text("caption2").font(.caption2)
                     Text("caption2 bold").font(.caption2).bold()
                     
                     
                     Text("headline").font(.headline)
                     Text("headline bold").font(.headline).bold()
                     
                     Text("subheadline").font(.subheadline)
                     Text("subheadline bold").font(.subheadline).bold()
                     
                     
                     Text("title2").font(.title2)
                     Text("title2 bold").font(.title2).bold()
                     
                     Text("title3").font(.title3)
                     Text("title3 bold").font(.title3).bold()*/
                }
            }).previewLayout(.sizeThatFits)
        }
    }
}
