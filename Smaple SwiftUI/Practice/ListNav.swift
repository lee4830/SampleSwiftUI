//
//  ListNav.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct ListNav: View {
    @ObservedObject var viewRouter:ViewRouter
    
    let cars = CarMaker.all()
    var body: some View {
        VStack{
            NavigationView{
                
                List(self.cars,id: \.name){carMaker in
                    
                    NavigationLink(
                        destination: ListNavDetail(carMaker: carMaker)){
                        //각 row UI
                        ListNavCell(cars: carMaker)
                    }
                    
                    
                    
                }.navigationBarTitle("자동차 제조사",displayMode:.inline)
                
            }
            
            
            Button(action:{self.viewRouter.currentPage="test"}){
                Text("TestPage")
            }
        }
        
    }
}

struct ListNavCell:View{
    let cars:CarMaker
    var body: some View{
        HStack{
            Image(cars.imageUrl)
                .resizable()
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .cornerRadius(16)
            
            VStack{
                Text(cars.name).font(.largeTitle)
                Text("\(cars.numberOfStore) 지점")
            }
        }
    }
    
}


struct ListNav_Previews: PreviewProvider {
    static var previews: some View {
        ListNav(viewRouter:ViewRouter())
    }
}
