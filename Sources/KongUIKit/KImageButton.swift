//
//  SwiftUIView.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/24/25.
//

import SwiftUI

public struct KImageButton: View {
    let image: Image
    let onClick: () -> Void
    let title:Text?
    let style:KImageLabel.Style
    
    public init(image: Image,
                title:Text? = nil,
                style:KImageLabel.Style = .init(foregroundColor: .primary, backgroundColor: .secondary, padding: 5, cornerRadius: 10),
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
            KImageLabel(image: image,
                        title: title,
                        style: style
            )
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
