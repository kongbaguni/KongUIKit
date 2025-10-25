//
//  KBarcodeView.swift
//  KongUIKit
//
//  Created by Changyeol Seo on 10/25/25.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

fileprivate extension String {
    var barcodeImage:UIImage? {
        let context = CIContext()
        let filter = CIFilter.code128BarcodeGenerator()
        
        guard let data = self.data(using: .ascii) else { return nil }
        filter.message = data
        
        guard let outputImage = filter.outputImage else { return nil }
        
        // 바코드를 크게 확대해서 선명하게 표시
        let scaledImage = outputImage.transformed(by: CGAffineTransform(scaleX: 3, y: 3))
        
        if let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
}

public struct KBarcodeView: View {
    public init(text: String, conerRadius: CGFloat = 0) {
        self.text = text
        self.cornerRadius = conerRadius
    }
    
    let text:String
    let cornerRadius:CGFloat
    
    public var body: some View {
        VStack {
            if let image = text.barcodeImage {
                Image(uiImage: image)
                    .resizable()
                    .interpolation(.none) // 픽셀 보존
                    .scaledToFit()
                    .cornerRadius(cornerRadius)
            } else {
                Text("바코드를 생성할 수 없습니다.")
                    .foregroundColor(.secondary)
            }
        }

    }
}
#Preview {
    VStack {
        KBarcodeView(text: "12341").frame(height: 100)
            .padding(20)
    }.background(.orange)
}
