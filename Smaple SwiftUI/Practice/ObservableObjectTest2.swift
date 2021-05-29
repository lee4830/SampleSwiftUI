//
//  ObservableObjectTest2.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct ObservableObjectTest2: View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    @ObservedObject var count = CountRepo2()
    var body: some View {
        Text("\(self.count.count)").font(.largeTitle)
        Button("숫자증가"){
            self.count.count += 1
        }
        
        Spacer()
        Button(action:{self.viewRouter.currentPage="test"}){
            Text("TestPage")
        }
    }
}
//조건 및 수동갱신 2로 나누어서 0일때만 갱신하도록
class CountRepo2: ObservableObject{
    var count: Int = 0{
        willSet(newVal){
            if(newVal % 2 == 0){
                objectWillChange.send()
            }
        }
    }
    
}

struct ObservableObjectTest2_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectTest2(viewRouter:ViewRouter())
    }
}
