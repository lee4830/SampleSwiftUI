//
//  Page1.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct Page1: View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    var body: some View{
        VStack{
            Text("Page1")
            
            Button(action:{self.viewRouter.currentPage = "page2"}){
                Text("page2")
            }
            Button(action:{self.viewRouter.currentPage = "BindingTest"}){
                Text("BindingTest")
            }
            Button(action:{self.viewRouter.currentPage = "NavigationTest"}){
                Text("NavigationTest")
            }
            
            Button(action:{self.viewRouter.currentPage = "ListNav"}){
                Text("ListNav")
            }
            Button(action:{self.viewRouter.currentPage = ""}){
                Text("ContentView")
            }
        }
    }
}
