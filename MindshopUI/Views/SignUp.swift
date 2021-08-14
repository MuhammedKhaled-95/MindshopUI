//
//  SignUp.swift
//  MindshopUI
//
//  Created by Muhammed on 30/07/2021.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var pageState:PageState = .signin
    @State var btnText="SIGN UP"
    @State var mainBtnText="SIGN IN"
    @State var lblText="Sign In"
    var DescText="Lorem ipsum dolor sit amet, consectetur adipiscing elit.Integer maximus accumsan erat id facilisis."
    
   
    
    var body: some View {
        VStack(spacing: 0, content: {
            VStack(spacing: 0, content: {
                HStack {
                    Text(lblText).foregroundColor(.white).font(.title).padding([.leading],30)
                    Spacer()
                }
                HStack {
                    Text(DescText).foregroundColor(.white).font(.caption).padding(.leading,30)
                    Spacer()
                }
            }) .padding(.vertical,30)
            .background(RoundedCorners(tl: 0, tr: 0, bl: 30, br: 30).fill(Color("LightRed")))
            VStack(alignment: .center, spacing: 20, content: {
                if(self.pageState == .signup){
                    CustomizedTextField(mainMsg: "",placeHolder:"Name", pwField: false)
                    CustomizedTextField(mainMsg: "",placeHolder:"Email", pwField: false)
                    CustomizedTextField(mainMsg: "",placeHolder:"Password",pwField: true)
                }else if(self.pageState == .signin){
                    CustomizedTextField(mainMsg: "",placeHolder:"Email", pwField: false)
                    CustomizedTextField(mainMsg: "",placeHolder:"Password",pwField: true)
                }else{
                    CustomizedTextField(mainMsg: "",placeHolder:"Enter E-mail…", pwField: false)
                }
                
                self.pageState != .forgetpass ? HStack {
                    Spacer()
                    Button( action:resetPassword, label: {
                        Text("Forgot password?").font(.caption)
                    }).foregroundColor(Color("LightRed"))
                }.frame(width: 285) : nil
                BlackRoundedBtn(mainBtnText: self.mainBtnText, btnWidth: 285,btnHeight:50,mainColor: Constants.fgColor ,textColor: Constants.bgColor, action: {
                    print("Siging in now")
                })
            }).padding(.top,20)
            Spacer()
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                Text("Or Sign in with social media").font(.body)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                    ForEach(0..<4){i in
                        CustomizedCircle(includeIMG:true, circleRadius:Constants.screenSize.width/7, circleColor:i==0 ? Color("fbBlue"):  Color("SilverColor"), selectedImage: "fbLogo", isSystemNamed: i != 0)
                    }
                })
            }).padding(.bottom,30)
        }).edgesIgnoringSafeArea(.bottom).navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        }),trailing: Button( action:topBTNClicked, label: {Text(btnText).font(.body).fontWeight(.bold)
        }).foregroundColor(Constants.fgColor))
        .foregroundColor(Constants.fgColor)
        .navigationBarBackButtonHidden(true)
    }
    
    func resetPassword() {
        self.mainBtnText="Send Password"
        self.btnText="SIGN IN"
        self.lblText="Forgot Password"
        self.pageState = .forgetpass
    }
    
    func topBTNClicked(){
        if(self.pageState == .signin){
            self.pageState = .signup
            self.lblText="Sign Up"
            self.btnText="SIGN IN"
        }else if(self.pageState == .forgetpass){
            self.pageState = .signin
            self.lblText="Sign In"
            self.btnText="SIGN UP"
        }else{
            self.pageState = .signin
            self.lblText="Sign Up"
            self.btnText="SIGN IN"
        }
    }
}

struct Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .previewDevice("iPhone 12")
    }
}
