//
//  SwiftUIView.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/24/25.
//

import SwiftUI

public struct KImageButton: View {
    
    public struct Style : Sendable {
        let foregroundColor: Color
        let backgroundColor: Color
        let padding:CGFloat
        let cornerRadius:CGFloat
        public init(foregroundColor: Color, backgroundColor: Color, padding: CGFloat, cornerRadius: CGFloat) {
            self.foregroundColor = foregroundColor
            self.backgroundColor = backgroundColor
            self.padding = padding
            self.cornerRadius = cornerRadius
        }
        
        public static let simple: Style = .init(foregroundColor: .primary, backgroundColor: .clear, padding: 5, cornerRadius: 10)
    }
    
    let image: Image
    let onClick: () -> Void
    let title:Text?
    let style:Style
    
    public init(image: Image,
                title:Text? = nil,
                style:Style = .init(foregroundColor: .primary, backgroundColor: .secondary, padding: 5, cornerRadius: 10),
                onClick: @escaping () -> Void) {
        self.image = image
        self.onClick = onClick
        self.title = title
        self.style = style
  }
    
    public var body: some View {
        Button {
            onClick()
        } label: {
            VStack {
                image.resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .foregroundStyle(style.foregroundColor)
                if let title {
                    title.foregroundColor(style.foregroundColor)
                }
            }
            .padding(style.padding)
            .background {
                RoundedRectangle(cornerRadius: style.cornerRadius)
                    .fill(style.backgroundColor)
            }
        }
    }
}

#Preview {
    HStack (spacing:5) {
        KImageButton(image: .init(systemName: "circle"),
                     title: .init("test test"),
                     style: .init(foregroundColor: .yellow, backgroundColor: .black, padding: 10, cornerRadius: 30)
        ) {
            print("test test")
        }
        KImageButton(image: .init(systemName: "circle"),
                     style: .simple
        ) {
            print("test test")
        }
    }.padding(5)
    
}
