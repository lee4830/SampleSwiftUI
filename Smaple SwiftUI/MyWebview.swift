//
//  MyWebview.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI
import WebKit


//만약 swiftui에서 Controller를 사용하기 위해선 UIViewControllerRepresentable을 사용
//swiftui에서 UIViewRepresentable uikit의 uiview를 사용할 수 있도록 한다.
struct MyWebview:UIViewRepresentable {
    
    
    
    var urlToLoad: String
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string:self.urlToLoad) else {
            let w = WKWebView()
            let u = URL(string:("https://www.apple.com/kr"))
            w.load(URLRequest(url:u!))
            return w
        }
        
        //웹뷰 인스턴스 생성
        let webview = WKWebView()
        //웹뷰 로드
        webview.load(URLRequest(url:url))
        
        return webview
    }
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
        
    }
}


struct MyWebview_Previews: PreviewProvider{
    static var previews: some View{
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
