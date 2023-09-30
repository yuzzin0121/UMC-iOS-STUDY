//
//  horizonIten.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/29.
//

import UIKit

struct CollectionItem: Equatable{
    var itemImageName: String
    var title: String!
    var price: String!
    
    func getItemImage() -> UIImage?{
        return UIImage(named: itemImageName)!
    }
}
