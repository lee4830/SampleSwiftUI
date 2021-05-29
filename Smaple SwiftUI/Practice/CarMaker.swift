//
//  CarMaker.swift
//  Smaple SwiftUI
//
//  Created by Jihyung Lee on 2021/05/29.
//

import SwiftUI

struct CarMaker{
    let name: String
    let imageUrl: String
    let numberOfStore: Int
}


extension CarMaker{
    static func all() ->[CarMaker]{
        return [
            CarMaker(name:"드림카1",imageUrl: "car1",numberOfStore: 2000),
            CarMaker(name:"드림카2",imageUrl: "car2",numberOfStore: 2100),
            CarMaker(name:"드림카3",imageUrl: "car3",numberOfStore: 2200)
        ]
    }
}
