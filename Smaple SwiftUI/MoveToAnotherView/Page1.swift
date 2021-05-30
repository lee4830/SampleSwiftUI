//
//  Page1.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct MyItems{
    let name: String
}
extension MyItems{
    static func all()->[MyItems]{
        return[
            MyItems(name:"page2"),
            MyItems(name:"BindingTest"),
            MyItems(name:"NavigationTest"),
            MyItems(name:"ListNav"),
            MyItems(name:"BindingTest2"),
            MyItems(name:"ObservableObjectTest"),        
            MyItems(name:"ObservableObjectTest2"),
            MyItems(name:"EnviromentObjectTest"),
            MyItems(name:"ViewDragTest"),
            MyItems(name:"ContentView")
        ]
    }
}

struct Page1: View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    let items = MyItems.all()
    
    var body: some View{
        VStack{
            Text("Page1")
            
            //id:\.self ?
            List(self.items,id:\.name){temp in
                Button(action:{self.viewRouter.currentPage = temp.name}){
                    Text("\(temp.name)")
                }
            }
            

        }
    }
}
