//
//  BindingTest.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct BindingTest:View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    @State var name = ""
    @State var age = ""
    
    var body: some View{
        Form{
            TextField("이름을 입력해주세요",text:$name)
            TextField("나이를 입력해주세요",text:$age)
            Text("\(name)님의 나이는 \(age)")
            Spacer()
            Button(action:{self.viewRouter.currentPage="test"}){
                Text("TestPage")
            }
            
        }
    }
}
