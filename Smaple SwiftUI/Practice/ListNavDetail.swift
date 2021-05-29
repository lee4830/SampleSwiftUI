//
//  ListNavDetail.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct ListNavDetail: View {
    
    //양방향 바인딩을 위해 @State 추가
    
    @State var isPresent:Bool = false
    
    let carMaker: CarMaker
    
    
    
    var body: some View {
        VStack{
            Image(carMaker.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture(count:2,perform:{
                    self.isPresent = true
                })
            
            Text(carMaker.name)
            Spacer()
        }.alert(isPresented: $isPresent, content: {
            Alert(title:Text("더블클릭"),message: Text("하셨네요."),dismissButton: .default(Text("OK!")))
        })
//        .background(Color.gray)
//        .frame(minWidth: 0,maxWidth: .infinity,
//               minHeight: 0, maxHeight: .infinity)
        
    }
}

struct ListNavDetail_Previews: PreviewProvider {
    static let previewMaker = CarMaker(name: "test",imageUrl: "car1",numberOfStore: 1000)
    static var previews: some View {
        ListNavDetail(carMaker:previewMaker)
    }
}
