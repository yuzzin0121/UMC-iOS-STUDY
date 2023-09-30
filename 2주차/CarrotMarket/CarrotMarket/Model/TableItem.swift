//
//  Item.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/27.
//

import UIKit

struct TableItem: Equatable {
    var itemImageName: String
    var title: String!
    var location: String!
    var time: String!
    var price: String!
    
    func getItemImage() -> UIImage?{
        return UIImage(named: itemImageName)!
    }
}
