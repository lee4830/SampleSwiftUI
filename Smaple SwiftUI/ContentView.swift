//
//  ContentView.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    
    //변화 감지 하여 뷰를 다시 그림.
    @State
    private var isActivated:Bool = false
    
    @ObservedObject var viewRouter:ViewRouter
    
    var body: some View {
        
        
        NavigationView{
            VStack{
                
                HStack{
                    
                    //MyVstackView 안에 값에 바인딩
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    
                    
                }//HStack
                .padding(self.isActivated ? 20.0 : 10.0)
                .background(self.isActivated ? Color.yellow : Color.black)
                .onTapGesture {
                    
                    withAnimation{
                        self.isActivated.toggle()
                    }
                    
                    print("HStack이 클릭됨.")
                    
                }//HStack onTapGesture
                
                
                
                NavigationLink(
                    destination: MyTextView(isActivated: $isActivated)){
                    Text("네비게이션")
                        .font(.system(size:30))
                        .fontWeight(.heavy)
                        .padding(2)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                        .cornerRadius(30)
                }
                
                NavigationLink(
                    destination: WebviewContentView()){
                    Text("웹뷰")
                        .font(.system(size:30))
                        .fontWeight(.heavy)
                        .padding(2)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                        .cornerRadius(30)
                }
                
                Button(action:{viewRouter.currentPage = "test"}){
                    Text("TestPage")
                }
                
                
                
            }//VStack
            .frame(minWidth: 0, maxWidth: .infinity,
                   minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            //네비게이션 바 기본값인 .Large에서 작은 값으로 변경
            //            .navigationBarTitleDisplayMode(.inline)
            //네비게이션바 타이틀 숨김.
            //            .navigationTitle("타이틀")
            //            .navigationBarHidden(true)
            
        }//NavigationView
        
        
        
        
        
        
    
        
        
    }//some View
    
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewRouter:ViewRouter())
    }
}
