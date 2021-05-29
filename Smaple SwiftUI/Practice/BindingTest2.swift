//
//  BindingTest2.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct BindingTest2: View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    @State
    var isToggleOn: Bool = true
    
    var body: some View {
        VStack{
            ChildView(isTo: $isToggleOn)
            if isToggleOn {
                Text("글자!")
            }
            
            Spacer()
            
            Button(action:{self.viewRouter.currentPage="test"}){
                Text("TestPage")
            }
        }
    }
}

struct ChildView:View{
    @Binding var isTo:Bool
    
    var body: some View{
        Toggle(isOn:$isTo){
            Text("글자를 가립니다.")
        }.padding()
    }
}


struct BindingTest2_Previews: PreviewProvider {
    static var previews: some View {
        BindingTest2(viewRouter:ViewRouter())
    }
}
