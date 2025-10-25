//
//  KTextScrollView.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/25/25.
//

import SwiftUI
public struct KTextScrollView : View {
    public struct Style : Sendable{
        let backgroundColor: Color
        let foregroundColor: Color
        let cornerRadius: CGFloat
        
        public static let `default`: Style = .init(backgroundColor: .clear,
                                            foregroundColor: .primary,
                                            cornerRadius: 8)
    }
    
    public init(string: String, style: Style = .default) {
        self.string = string
        self.style = style
    }
    
    let string: String
    let style: Style
    
    public var body: some View {
        ScrollView {
            HStack {
                Text(string)
                    .font(.caption)
                    .foregroundStyle(style.foregroundColor)
                Spacer()
            }.padding(10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .stroke(style.foregroundColor, lineWidth: 1)
        }
        .background {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .fill(style.backgroundColor)
        }
    }
}

#Preview {
    KTextScrollView(string: "Hello World", style: .default)
        .padding(50)
}
