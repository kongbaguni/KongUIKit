//
//  KImageLabel.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/30/25.
//

import SwiftUI

public struct KImageLabel: View {
    public struct Style : Sendable {
        let foregroundColor: Color
        let backgroundColor: Color
        let padding:CGFloat
        let cornerRadius:CGFloat
        let isHorizontal:Bool
        
        public init(
            foregroundColor: Color,
            backgroundColor: Color,
            padding: CGFloat,
            cornerRadius: CGFloat,
            isHorizontal: Bool = true
        ) {
            self.foregroundColor = foregroundColor
            self.backgroundColor = backgroundColor
            self.padding = padding
            self.cornerRadius = cornerRadius
            self.isHorizontal = isHorizontal
        }
        
        public static let simple: Style = .init(foregroundColor: .primary, backgroundColor: .clear, padding: 5, cornerRadius: 10, isHorizontal: false)
        
        public static let horizontalButton : Style = .init(
            foregroundColor: .primary,
            backgroundColor: .teal,
            padding: 10,
            cornerRadius: 20,
            isHorizontal: true
        )
    }
    
    let image: Image
    let title:Text?
    let style:Style
    
    public init(image: Image,
                title:Text? = nil,
                style:Style = .init(foregroundColor: .primary, backgroundColor: .secondary, padding: 5, cornerRadius: 10)) {
        self.image = image
        self.title = title
        self.style = style
    }
    
    var label: some View {
        Group {
            if style.isHorizontal {
                HStack {
                    image.resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .foregroundStyle(style.foregroundColor)
                    if let title {
                        title.foregroundColor(style.foregroundColor)
                    }
                }
            }
            else {
                VStack {
                    image.resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .foregroundStyle(style.foregroundColor)
                    if let title {
                        title.foregroundColor(style.foregroundColor)
                    }
                }
            }
        }
        .padding(style.padding)
        .background {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .fill(style.backgroundColor)
        }
    }
    public var body: some View {
        if #available(iOS 26.0, *) {
            label.glassEffect(.clear.interactive(),
                              in: .rect(cornerRadius: style.cornerRadius))
        } else {
            label
        }
    }
    
}

#Preview {
    VStack {
        HStack (spacing:5) {
            KImageLabel(image: .init(systemName: "circle"),
                         title: .init("test test"),
                         style: .init(foregroundColor: .yellow,
                                      backgroundColor: .black,
                                      padding: 10,
                                      cornerRadius: 30,
                                      isHorizontal: false)
            )
            KImageLabel(image: .init(systemName: "circle"),
                        title: .init("test test"),
                         style: .simple
            )
        }.padding(5)
        
        KImageLabel(image: .init(systemName: "circle"),
                     title: .init("asdasd asd"),
                     style: .horizontalButton
        )
        .frame(height: 50)
        .padding(.top, -40)
        
    }
    
    
}
