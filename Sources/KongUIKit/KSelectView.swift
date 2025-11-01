//
//  KSelectView.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/28/25.
//
import SwiftUI

public struct KSelectView: View {
    public struct Item : Hashable {
        public init(id: Int, color: Color) {
            self.id = id
            self.color = color
        }
        public let id: Int
        public let color: Color
    }
    
    public init(items: [Item], canCancel: Bool = false, selected: Binding<Item?> = .constant(nil)) {
        self.items = items
        self._selected = selected
        self.canCancel = canCancel
    }
    
    let items: [Item]
    let canCancel: Bool
    @Binding var selected: Item?
    
    func retangle(_ item:Item) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(item.color)
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(selected == item ? .primary : Color.clear, lineWidth: 7)
            }
    }
    
    var scrollView : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id: \.self) { item in
                    Button {
                        if canCancel && selected == item {
                            self.selected = nil
                            return                            
                        }
                        selected = item
                    } label: {
                        if #available(iOS 26.0, *) {
                            retangle(item)
                                .glassEffect(.clear.interactive(), in: .rect(cornerRadius: 25)
                                )
                        } else {
                            retangle(item)
                        }
                    }
                    .padding(5)
                    .frame(width: 50, height: 50)
                }
            }
        }
    }
    public var body: some View {
        if #available(iOS 26.0, *) {
            scrollView.glassEffect(.clear.interactive(), in: .rect(cornerRadius: 10))
        } else {
            scrollView
        }
    }
}

#Preview {
    VStack {
        KSelectView(items: [
            KSelectView.Item(id: 1, color: Color.red),
            KSelectView.Item(id: 2, color: Color.orange),
            KSelectView.Item(id: 3, color: Color.yellow),
            KSelectView.Item(id: 4, color: Color.green),
            KSelectView.Item(id: 5, color: Color.blue),
            KSelectView.Item(id: 6, color: Color.purple)
        ], selected: .constant(KSelectView.Item(id: 1, color: Color.red)))
        
        KSelectView(items: [
            KSelectView.Item(id: 1, color: Color.orange),
            KSelectView.Item(id: 2, color: Color.red)
        ], selected: .constant(KSelectView.Item(id: 2, color: Color.red)))

    }
}
