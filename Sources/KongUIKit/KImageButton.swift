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
        
        public static let simple: Style = .init(foregroundColor: .primary, backgroundColor: .clear, padding: 5, cornerRadius: 10)
        
        public static let horizontalButton : Style = .init(
            foregroundColor: .primary,
            backgroundColor: .teal,
            padding: 10,
            cornerRadius: 20,
            isHorizontal: true
        )
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
    }
}

#Preview {
    VStack {
        HStack (spacing:5) {
            KImageButton(image: .init(systemName: "circle"),
                         title: .init("test test"),
                         style: .init(foregroundColor: .yellow,
                                      backgroundColor: .black,
                                      padding: 10,
                                      cornerRadius: 30,
                                      isHorizontal: false)
            ) {
                print("test test")
            }
            KImageButton(image: .init(systemName: "circle"),
                         style: .simple
            ) {
                print("test test")
            }
        }.padding(5)
        
        KImageButton(image: .init(systemName: "circle"),
                     title: .init("asdasd asd"),
                     style: .horizontalButton
        ) {
            print("test test")
        }.frame(height: 50)
        
    }
    
    
}
