//
//  ContentView.swift
//  MindshopUI
//
//  Created by Rene van der Kooi on 24/7/2564 BE.
//
/*
 
 ******************** INSTRUCTIONS  ********************
 Use NavigationView with large title
 Use sample data to create views
 Use re-usable Components. Do NOT make custom views each time. Rather a general component which taks properties
 Any action which is not in the design but should have an action, put aØ print("clicked") action
 Do NOT use any external PODS, use all basic elements from SwiftUI
 Use Standard Capsule for Top Pills
 Use accessability where possible such as
 
 Label(attendee, systemImage: "person")
 .accessibilityLabel(Text("Person"))
 .accessibilityValue(Text(attendee))
 
 Label("\(object.title)", systemImage: "clock")
 .padding(.trailing, 20)
 .accessibilityElement(children: .ignore)
 .accessibilityLabel(Text("\(object.title)"))
 .accessibilityValue(Text("\(object.title) minutes"))
 OO
 TabImages or other icons not in systemImage, use PDF image with singlescale
 Font uses: Standard  Nunito (all languages but Thai)
 Font uses: Sukhumvit Set
 Font: Please create a font template set: .body, .title, .largeTitle, .smallTitle, .smallText, .tinyText
 Color scheme: .dark and .light
 Color scheme: .dark means every part which is WHITE in the design ecomes black
 Color scheme: .light means every part which is WHITE in the design ecomes WHITE
 Color scheme: every "red" color in the design is linked to the AppConfig.colorPrimary color.
 
 ******************** INSTRUCTIONS  ********************
 */
import SwiftUI

struct ContentView: View {
    @State var navigateState=false
    @State private var currentTab: Tab = Tab.home
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(ConfigHelper.shared().appConfig?.getBgColor() ?? .white)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(ConfigHelper.shared().appConfig?.getFgColor() ?? .black)]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(ConfigHelper.shared().appConfig?.getFgColor() ?? .black)]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

        UINavigationBar.appearance().tintColor = .white
    }
    
    
    
    var body: some View {
        
        NavigationView{
            TabView(selection: $currentTab,
                    content:  {
                        HomeScreen(searchText: "", selectedBTN: 1).tabItem {
                            Label("Shop", systemImage: "bag.fill")}.tag(Tab.home).navigationBarHidden(false)
                        Text("Here will add the notification page").tabItem { Label("Notifications", systemImage: "bell.circle.fill")}.tag(Tab.notifications).navigationBarHidden(true)
                        ProfileScreen().tabItem { Label("Account", systemImage: "person.crop.circle.fill")}.tag(Tab.settings).navigationBarHidden(true)
                    }).accentColor(Color.black)
                .navigationBarTitle("Products")
                .navigationBarItems(trailing:  HStack {
                    Spacer()
                    CircleSystemNamed(Radius: 30, CircleColor: "LighterSilver", Icon: "bell", IconSize: 12)
                        .accessibilityLabel(Text("Button"))
                    NavigationLink(
                        destination: SignUpView().navigationBarTitleDisplayMode(.inline),
                        isActive: $navigateState,
                        label: {
                            CircleSystemNamed(Radius: 30, CircleColor: "LighterSilver", Icon: "cart", IconSize: 12)
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    self.navigateState=true
                                }
                        })
                })
            //                .navigationBarItems(leading:
            //                                        Button(action: {
            //                                            print("SF Symbol button pressed...")
            //                                        }) {
            //                                            Image(systemName: "calendar.circle").imageScale(.large)
            //                                        }
            //                    .accessibilityLabel(Text("Button"))
            //                                        .accessibilityValue(Text("Calendar"))
            //                                        .clipShape(Circle())
            //                                        .foregroundColor(Color.gray),
            //                                    trailing:
            //                                        HStack {
            //                                            Button(action: {
            //                                                print("SF Symbol button pressed...")
            //                                            }) {
            //                                                Image(systemName: "calendar.circle")
            //                                                    .imageScale(.large)
            //                                            }
            //                                            .accessibilityLabel(Text("Button"))
            //                                            .accessibilityValue(Text("Calendar"))
            //                                            .clipShape(Circle())
            //                                            .foregroundColor(Color.gray)
            //
            //                                            Button(action: {
            //                                                print("SF Symbol button pressed...")
            //                                            }) {
            //                                                Image(systemName: "calendar.circle")
            //                                                    .imageScale(.large)
            //                                            }
            //                                            .accessibilityLabel(Text("Button"))
            //                                            .accessibilityValue(Text("Calendar"))
            //                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            //                                            .foregroundColor(Color.gray)
            //                                        }
            //                )
        }
        
    }
}

enum Tab {
    case home, notifications, settings
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
