//
//  KSelectView.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/28/25.
//
import SwiftUI

public struct KSelectView: View {
    public struct Item : Hashable {
        public init(id: String, color: Color) {
            self.id = id
            self.color = color
        }
        let id: String
        let color: Color
    }
    
    let items: [Item]
    @Binding var selected: Item?
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id: \.self) { item in
                    Button {
                        selected = item
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(item.color)
                            .background {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(selected == item ? .primary : Color.clear, lineWidth: 7)
                            }
                            
                    }
                    .padding(5)
                    .frame(width: 50, height: 50)
                }
            }
        }.padding()
    }
}

#Preview {
    VStack {
        KSelectView(items: [
            .init(id:"1", color: .red),
            .init(id:"2", color: .orange),
            .init(id:"3", color: .yellow),
            .init(id:"4", color: .green),
            .init(id:"5", color: .blue),
            .init(id:"6", color: .purple)
        ], selected: .constant(.init(id:"1", color: .red)))
        
        KSelectView(items: [
            .init(id:"1", color: .orange),
            .init(id:"2", color: .red)
        ], selected: .constant(.init(id:"2", color: .red)))

    }
}
