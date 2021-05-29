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
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "page1"{
        didSet{
            objectWillChange.send(self)
        }
    }
}
