//
//  ViewRouter.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter:ObservableObject{
    
    
    //@Published 를 사용하지 않았기때문에 바로 UI가 갱신되지 않음
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    //ViewRouter()초기화시 page1이 기본값.
    var currentPage: String = "page1"{
        didSet{
            //@Published를 사용하지 않아 직접 값을 세팅함.
            objectWillChange.send(self)
            

        }
    }
}
