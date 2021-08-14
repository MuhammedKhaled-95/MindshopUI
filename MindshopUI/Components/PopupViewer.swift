//
//  PopupViewer.swift
//  MindshopUI
//
//  Created by Muhammed on 06/08/2021.
//

import SwiftUI


struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool
 
    init(isPresented: Bool, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        popup = content()
    }
 
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
    
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .animation(.spring()) // 1.
                    .transition(.offset(x: 0, y: geometry.belowScreenEdge)) // 2.
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

private extension GeometryProxy {
    var belowScreenEdge: CGFloat {
        UIScreen.main.bounds.height - frame(in: .global).minY
    }
}
