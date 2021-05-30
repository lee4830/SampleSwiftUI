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
            }else if viewRouter.currentPage == "BindingTest"{
                BindingTest(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "NavigationTest"{
                NavigationTest(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "ListNav"{
                ListNav(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "BindingTest2"{
                BindingTest2(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "ObservableObjectTest"{
                ObservableObjectTest(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "ObservableObjectTest2"{
                ObservableObjectTest2(viewRouter:viewRouter)
            }else if viewRouter.currentPage == "EnviromentObjectTest"{
                EnviromentObjectTest(viewRouter:viewRouter).environmentObject(CountRepo3())
            }else if viewRouter.currentPage == "ViewDragTest"{
                ViewDragTest(viewRouter:viewRouter)
            }
            
            
            else{
                ContentView(viewRouter:viewRouter)
            }
            
        }
    }
}
