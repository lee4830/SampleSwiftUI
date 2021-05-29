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
struct MyWebview:UIViewRepresentable, WebViewHandlerDelegate{
    func receivedStringValueFromWebView(value: String) {
        print("String 데이터가 웹으로부터 전달 됨")
    }
    func receivedJsonValudeFromWebView(value: [String : Any?]) {
        print("Json 데이터가 웹으로부터 전달 됨")
    }
    
    
    
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
        
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false // javascript가 사용자 상호 작용없이 창을 열 수 있는지 여부
        
        let configuration = WKWebViewConfiguration()
        //웹에선언된 커스텀 JS 이름 규칙 임의로 정해서 추가.
        configuration.userContentController.add(self.makeCoordinator(),name:"bridge_name")
        configuration.preferences = preferences
        
        
        //웹뷰 인스턴스 생성
        let webview = WKWebView(frame:CGRect.zero, configuration: configuration)
//        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        
    
        //웹뷰 로드
        webview.load(URLRequest(url:url))
        
        
        
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
        //자기자신 MyWebview 구성요소 접근을 위함.
        let parent: MyWebview
        
        
        var delegate: WebViewHandlerDelegate?
        
        init(_ parent:MyWebview){
            self.parent = parent
            
            //MyWebview의 WebViewHandlerDelegate
            self.delegate = parent
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

//규약 정의
protocol WebViewHandlerDelegate{
    func receivedJsonValudeFromWebView(value:[String: Any?])
    func receivedStringValueFromWebView(value: String)
}

/*
 
 웹과 통신하기 위한 이름을 bridge_name 로 정의 했을때
 
 
 From_Web_JS(웹 JS에서 native로 데이터 전달) :
 const sendData = {message:"Hello! I'm javaScript."}
 window.webkit.messageHandlers.bridge_name.postMessage(sendData);
 
 
 
 From_Native(네이티브에서 웹 JS로 데이터 전달) :
 webView.evaluateJavaScript("함수명('\("Hi, Javascript")')", completionHandler: { result, error in
     if let anError = error {
         print("Error \(anError.localizedDescription)")
     }
                     
     print("Result \(result ?? "")")
 })
 
 if web js has follow:
 function 함수명(data){
 
 }
 
 */

//클래스 확장.
extension MyWebview.Coordinator: WKScriptMessageHandler{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "bridge_name"{
            delegate?.receivedJsonValudeFromWebView(value: message.body as! [String : Any?])
        }else if let body = message.body as? String{
            delegate?.receivedStringValueFromWebView(value: body)
        }
    }
}
