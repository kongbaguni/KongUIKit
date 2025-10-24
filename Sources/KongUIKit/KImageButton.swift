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
    
    public var body: some View {
        Button {
            onClick()
        } label: {
            image.resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    KImageButton(image: .init(systemName: "circle")) {
        print("test")
    }
    .frame(width: 30, height: 30)
}
