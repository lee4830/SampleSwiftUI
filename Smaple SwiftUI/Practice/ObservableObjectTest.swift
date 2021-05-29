//
//  ObservableObjectTest.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct ObservableObjectTest: View {
    @ObservedObject var viewRouter:ViewRouter
    
    @ObservedObject var count = CountRepo()
    
    var body: some View {
        VStack{
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
}


class CountRepo: ObservableObject{
    @Published var count: Int = 0
}

struct ObservableObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectTest(viewRouter:ViewRouter())
    }
}
