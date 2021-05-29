//
//  NavigationTest.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct NavigationTest:View {
    @ObservedObject var viewRouter:ViewRouter
    
    let genderType = ["남성","여성","시크릿"]
    
    @State var name = ""
    @State var bornIn = 0
    @State var gender = 0
    
    var resultScript:String{
        if(name.isEmpty){
            return "이름을 입력해주세요"
        }else{
            return "\(name)님의 성별이 \(genderType[gender])이며, 나이는 \(120 - bornIn))입니다."
        }
    }
    
    var body: some View{
        NavigationView{
            Form{
                Section(header:Text("이름")){
                    TextField("이름을 입력해주세요",text: $name).keyboardType(.default)
                }
                
                Section(header:Text("생년월일")){
                    Picker("출생년도",selection:$bornIn){
                        ForEach(1900 ..< 2019){
                            Text("\(String($0))년생")
                        }
                    }
                }
                
                
                Section(header:Text("성별")){
                    Picker("성별",selection:$gender){
                        ForEach(0 ..< genderType.count){
                            Text("\(self.genderType[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("결과")){
                    Text("\(resultScript)")
                }
            
                Button(action:{self.viewRouter.currentPage="test"}){
                    Text("TestPage")
                }
                
            }.navigationTitle("회원가입")
        }
    }
    
}
