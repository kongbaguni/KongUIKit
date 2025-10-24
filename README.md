# KongUIKit 

유용한 UI 컴포넌트킷

## KImageButton 
이미지 버튼 
```Swift
KImageButton(image: .init(systemName: "circle"),
             title: .init("test test"),
             style: .init(foregroundColor: .yellow, backgroundColor: .black, padding: 10, cornerRadius: 30)
) {
    print("test test")
}

KImageButton(image: .init(systemName: "circle")
) {
    print("test test")
}
```

