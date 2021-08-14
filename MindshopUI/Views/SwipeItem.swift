//
//  SwipeItem.swift
//  MindshopUI
//
//  Created by Muhammed on 13/08/2021.
//
import SwiftUI
import Foundation

struct SwipeItem<Content: View, Right: View>: View {
    var content: () -> Content
    var right: () -> Right
    var itemHeight: CGFloat
    
    @State var hoffset: CGFloat = 60
    @State var anchor: CGFloat = 0
    
    let screenWidth = UIScreen.main.bounds.width
    var anchorWidth: CGFloat { screenWidth / 7 }
    var swipeThreshold: CGFloat { screenWidth / 25 }
    
    @State var rightPast = false
    @State var leftPast = false
    
    init(@ViewBuilder content: @escaping () -> Content,
                      @ViewBuilder right: @escaping () -> Right,
                      itemHeight: CGFloat) {
        self.content = content
        self.right = right
        self.itemHeight = itemHeight
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    hoffset = anchor + value.translation.width
                    
                    if abs(hoffset) > anchorWidth {
                        if leftPast {
                            hoffset = anchorWidth
                        } else if rightPast {
                            hoffset = -anchorWidth
                        }
                    }
                    
                    if anchor > 0 {
                        leftPast = hoffset > anchorWidth - swipeThreshold
                    } else {
                        leftPast = hoffset > swipeThreshold
                    }
                    
                    if anchor < 0 {
                        rightPast = hoffset < -anchorWidth + swipeThreshold
                    } else {
                        rightPast = hoffset < -swipeThreshold
                    }
                }
            }
            .onEnded { value in
                withAnimation {
                    if rightPast {
                        anchor = -anchorWidth
                    } else if leftPast {
                        anchor = anchorWidth
                    } else {
                        anchor = 0
                    }
                    hoffset = anchor
                }
            }
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                content()
                    .frame(width: geo.size.width)
                    .zIndex(0)
                right()
                    .frame(width: anchorWidth)
                    .zIndex(1)
                    .clipped()
            }
        }
        .offset(x: -anchorWidth + hoffset)
        .frame(maxHeight: itemHeight)
        .contentShape(Rectangle())
        .gesture(drag)
        .clipped()
    }
}


struct SwipeItem_preview: PreviewProvider {
    static var previews: some View {
        SwipeItem(content: {
            ItemCard(noOfItems: 1, ItemCost:75, ItemName: "Nike", ItemColor:"Black", ItemSize:"L")
        },
        right: {DeleteCardView(action: {})
        }, itemHeight: Constants.screenSize.height/5)
        .previewDevice("iPhone 12")
    }
}
