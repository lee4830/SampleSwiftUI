//
//  MyVstackView.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/28.
//

import SwiftUI

struct MyVstackView:View {
    
    //데이터를 연동시킨다
    @Binding
    var isActivated:Bool
    init(isActivated: Binding<Bool> =
            .constant(false)){
        _isActivated = isActivated
    }
    
    var body: some View{
        VStack{
            Text("1!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size:60))
            Text("2!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size:60))
            Text("3!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size:60))
        }//VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}


struct MyVstackView_Priveiews: PreviewProvider{
    static var previews: some View{
        MyVstackView()
    }
}
