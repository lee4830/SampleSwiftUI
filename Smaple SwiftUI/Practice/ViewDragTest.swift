//
//  ViewDragTest.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/30.
//

import SwiftUI

struct ViewDragTest: View {
    @ObservedObject var viewRouter:ViewRouter
    
//    @State private var tapped:Bool = false
    @State private var draggedOffset = CGSize.zero
    var body: some View {
        Text("test TextView")
            .animation(.default)
            .offset(x:self.draggedOffset.width,y:self.draggedOffset.height)
            .gesture(DragGesture()
                        .onChanged{value in
                            
                            self.draggedOffset = value.translation
                        }
                        .onEnded{value in
                            self.draggedOffset = CGSize.zero
                        }
            )
        
        Spacer()
        Button(action:{self.viewRouter.currentPage="test"}){
            Text("TestPage")
        }
    }
}

struct ViewDragTest_Previews: PreviewProvider {
    static var previews: some View {
        ViewDragTest(viewRouter:ViewRouter())
    }
}
