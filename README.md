# KongUIKit 

유용한 UI 컴포넌트킷

## KImageLabel 
이미지를 사용하는 라벨 
```Swift
KImageLabel(image: .init(systemName: "circle"),
             title: .init("test test"),
             style: .init(foregroundColor: .yellow,
                          backgroundColor: .black,
                          padding: 10,
                          cornerRadius: 30,
                          isHorizontal: false)
)
KImageLabel(image: .init(systemName: "circle"),
             style: .simple
)
```

## KImageButton 
이미지 버튼 

```Swift
KImageButton(image: .init(systemName: "circle"),
             title: .init("test test"),
             style: .init(foregroundColor: .yellow, 
                        backgroundColor: .black, 
                        padding: 10, 
                        cornerRadius: 30)) {
    print("test test")
}

KImageButton(image: .init(systemName: "circle")) {
    print("test test")
}
```

## KBarcodeView 
바코드 뷰 

```Swift 
KBarcodeView(text:"test1234")
```

## KTextScrollView 
스크롤뷰 사용하는 텍스트뷰 

```Swift 
KTextScrollView(string: "Hello World",
                style: .init(backgroundColor: .yellow,
                             foregroundColor: .blue,
                             cornerRadius: 3)
)
.padding(50)
```
