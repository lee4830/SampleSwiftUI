//
//  WebviewContentView.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct WebviewContentView:View {
    var body: some View{

        
            HStack{
                NavigationLink(
                    destination: MyWebview(urlToLoad: "https://www.naver.com")
                        .edgesIgnoringSafeArea(.all)
                ){
                    Text("naver.com")
                        .font(.system(size:20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                                        }
                NavigationLink(
                    destination: MyWebview(urlToLoad: "https://www.daum.net")
                        .edgesIgnoringSafeArea(.all)
                ){
                    Text("daum.net")
                        .font(.system(size:20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(
                    destination: MyWebview(urlToLoad: "https://www.google.com")
                        .edgesIgnoringSafeArea(.all)
                ){
                    Text("google.com")
                        .font(.system(size:20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                
            }//hstack
            

        
    }//body
}


struct WebviewContentView_Previews:PreviewProvider {
    static var previews: some View{
        WebviewContentView()
    }
}
