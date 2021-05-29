//
//  CombineWebview.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct CombineWebview:View {
    
    
    
    var body: some View{
        
        
        VStack{

            MyWebview(urlToLoad: "https://www.apple.com")
            
            Text("abc")
                .font(.system(size:20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    print("navigationBarHidden = true")
                    navigationBarHidden(true)
                }
            
        }
    }
    
    
    
}


struct CombineWebview_Previews:PreviewProvider {
    static var previews: some View{
        CombineWebview()
    }
}
