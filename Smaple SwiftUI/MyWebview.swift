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
struct MyWebview:UIViewRepresentable{
    
    
    
    var urlToLoad: String
    
    func makeCoordinator() -> MyWebview.Coordinator {
        Coordinator(self)
    }
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string:self.urlToLoad) else {
            let w = WKWebView()
//            let u = URL(string:("https://www.apple.com/kr"))
//            w.load(URLRequest(url:u!))
            return w
        }
        
        
        
        //웹뷰 인스턴스 생성
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        
    
        //웹뷰 로드
        webview.load(URLRequest(url:url))
        
        
        print("test123")
        return webview
    }
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
        guard let mUrl = URL(string:self.urlToLoad) else{
            return
        }
        uiView.load(URLRequest(url:mUrl))
    }
    
    
   
    //WKNavigationDelegate
    class Coordinator: NSObject, WKNavigationDelegate{
        let parent: MyWebview
        init(_ parent:MyWebview){
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print("webView didCommit \(webView.url?.absoluteString)")
            
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("webView didFinish \(webView.url?.absoluteString)")
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("webView didFail \(webView.url?.absoluteString) error:\(error.localizedDescription)")
        }
        
        
        
    }
    
    
}


struct MyWebview_Previews: PreviewProvider{
    static var previews: some View{
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
