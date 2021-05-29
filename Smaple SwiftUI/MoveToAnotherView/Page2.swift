//
//  Page2.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct Page2: View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    var body: some View{
        VStack{
            Text("Page2")
            
            Button(action:{self.viewRouter.currentPage = "page1"}){
                Text("page1")
            }
            Button(action:{self.viewRouter.currentPage = ""}){
                Text("ContentView")
            }
        }
    }
}

