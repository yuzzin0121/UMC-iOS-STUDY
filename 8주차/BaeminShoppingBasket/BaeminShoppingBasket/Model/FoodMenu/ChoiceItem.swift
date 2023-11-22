//
//  ChoiceItem.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import Foundation

struct ChoiceItem: Hashable {
    var title: String
    var isSelected: Bool
    var name: String
    var price: Int
    var formattedPrice: String {    // "12,000"
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber: String = numberFormatter.string(for: price)!
        return formattedNumber
    }
    
    var convertedAddPrice: String {     // "+12,000원"
        String("+\(formattedPrice)원")
    }
    
    var formattedAddPrice: String {
        if price == 0 {
            return String("")
        } else {
            return String("(\(formattedPrice)원)")
        }
    }
    
    init(title: String="", isSelected: Bool=false, name: String, price: Int) {
        self.title = title
        self.isSelected = isSelected
        self.name = name
        self.price = price
    }
}
