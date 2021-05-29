//
//  EnviromentObjectTest.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

/* 현재 동작 안함
 추가로 수정 필요.
 EnviromentObjectTest() 호출시 다음과 같이 해야함
 EnviromentObjectTest().environmentObject(CountRepo3())
 */

struct EnviromentObjectTest: View {
    @ObservedObject var viewRouter:ViewRouter
    var body: some View {
        VStack{

            ChildTextView()
            ChildButtonView()
            Spacer()
            Button(action:{self.viewRouter.currentPage="test"}){
                Text("TestPage")
            }
        }
    }
}

struct ChildTextView:View{
    @EnvironmentObject var countRepo:CountRepo3
    var body: some View {
        Text("\(self.countRepo.count)").font(.largeTitle)
    }
}
struct ChildButtonView:View{
    @EnvironmentObject var countRepo:CountRepo3
    var body: some View {
        Button("숫자증가"){
            self.countRepo.count += 1
        }
    }
}

class CountRepo3:ObservableObject{
   @Published var count: Int = 0
}

struct EnviromentObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectTest(viewRouter:ViewRouter())
    }
}
