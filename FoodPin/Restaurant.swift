//
//  Restaurant.swift
//  FoodPin
//
//  Created by Johnny Mandela on 3/13/17.
//  Copyright © 2017 Johnny Mandela. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    // when two are named the same you use self. Self is connected to the var while the other is to the aurgument in init()
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
