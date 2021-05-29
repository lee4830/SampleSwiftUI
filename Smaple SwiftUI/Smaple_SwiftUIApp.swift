//
//  Smaple_SwiftUIApp.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/28.
//

import SwiftUI

@main
struct Smaple_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            //Combine ObservableObject를 이용한 페이지 이동.
            TestView(viewRouter: ViewRouter())
        }
    }
}
