//
//  MyTextView.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/28.
//

import SwiftUI

struct MyTextView:View {
    
    //데이터를 연동시킨다
    @Binding
    var isActivated:Bool
    init(isActivated: Binding<Bool> =
            .constant(false)){
        _isActivated = isActivated
    }
    
    //변화 감지 하여 뷰를 다시 그림.
    @State
    private var index: Int = 0
    
    private let backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body:some View{
        VStack{
            Spacer()
            Text("배경 아이템 인덱스 \(self.index + 1)")
                .font(.system(size:20))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: 100)
            
            Text("활성화 상태 : \(String(isActivated))")
                .font(.system(size:20))
                .fontWeight(.bold)
                .foregroundColor(self.isActivated ? Color.yellow : Color.gray)
                .background(Color.black)
            Spacer()
        }
        .background(backgroundColors[self.index])
        //SafeArea 까지 전체 확장하도록 함.
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("Tap Click")
            if(self.index==backgroundColors.count-1){
                self.index = 0
            }else{
                self.index += 1
            }
        }
    }
}


struct MyTextView_Previews: PreviewProvider{
    
    static var previews: some View{
        MyTextView()
    }
}
