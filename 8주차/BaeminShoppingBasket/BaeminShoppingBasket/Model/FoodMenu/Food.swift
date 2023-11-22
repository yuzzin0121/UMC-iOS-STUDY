//
//  Food.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import Foundation

// 음식 메뉴 정보
struct Food {
    var foodImageString: String
    var name: String
    var description: String
    var reviewCount: Int
    var defaultPrice: Int
    var formattedPrice: String {    // "12,000"
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber: String = numberFormatter.string(for: defaultPrice)!
        return formattedNumber
    }
    
    var convertedPriceToString: String {     // "12,000원"
        String("\(formattedPrice)원")
    }
    
    var itemMenus: [ItemMenu]
    
    init(foodImageString: String, name: String, description: String, reviewCount: Int, defaultPrice: Int, itemMenus: [ItemMenu]) {
        self.foodImageString = foodImageString
        self.name = name
        self.description = description
        self.reviewCount = reviewCount
        self.defaultPrice = defaultPrice
        self.itemMenus = itemMenus
    }
}
