//
//  Menu.swift
//  TheDeliveryPeople
//
//  Created by 조유진 on 2023/11/07.
//

import Foundation

struct Menu: Hashable {
    var imageFileName: String
    var title: String
    var subTitle: String
    
    init(imageFileName: String, title: String, subTitle: String) {
        self.imageFileName = imageFileName
        self.title = title
        self.subTitle = subTitle
    }
}
