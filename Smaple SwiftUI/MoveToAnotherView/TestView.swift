//
//  TestView.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI


struct TestView:View{
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View{
        VStack{
            
            if viewRouter.currentPage == "page1"{
                Page1(viewRouter:viewRouter)
            }
            else if viewRouter.currentPage == "page2"{
                Page2(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "test"{
                TestView(viewRouter:ViewRouter())
            }
            else{
                ContentView(viewRouter:viewRouter)
            }
            
        }
    }
}
