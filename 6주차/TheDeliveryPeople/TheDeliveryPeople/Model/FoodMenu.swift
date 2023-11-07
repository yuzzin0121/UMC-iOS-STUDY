//
//  FoodMenu.swift
//  TheDeliveryPeople
//
//  Created by 조유진 on 2023/11/07.
//

import Foundation

struct FoodMenu: Hashable {
    var imageFileName: String
    var name: String
    
    init(imageFileName: String, name: String) {
        self.imageFileName = imageFileName
        self.name = name
    }
}
