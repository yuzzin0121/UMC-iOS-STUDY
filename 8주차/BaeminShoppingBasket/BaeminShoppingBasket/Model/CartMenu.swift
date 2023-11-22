//
//  CartMenu.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import Foundation

struct CartMenu: Hashable {
    var foodImageString: String     // 음식 이미지
    var foodName: String            // 음식 이름
    var defaultPrice: Int           // 음식 기본 가격
    var price: Int                  // 음식 기본 가격 + 선택한 메뉴 가격
    var totalPrice: Int {           // 총 가격
        return price * menuCount
    }
    var formattedPrice: String {    // "12,000"
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber: String = numberFormatter.string(for: totalPrice)!
        return formattedNumber
    }
    var convertedPriceToString: String {     // "12,000원"
        String("\(formattedPrice)원")
    }
    
    var choiceItems: [ChoiceItem]       // 선택한 메뉴들
    var menuCount: Int                  // 음식 개수
    
    init(foodImageString: String="", foodName: String="", defaultPrice: Int=0, price: Int=0, choiceItems: [ChoiceItem]=[], menuCount: Int=1) {
        self.foodImageString = foodImageString
        self.foodName = foodName
        self.defaultPrice = defaultPrice
        self.price = price
        self.choiceItems = choiceItems
        self.menuCount = menuCount
    }
    
    func convertPriceToString(_ price: Int) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber: String = numberFormatter.string(for: price)!
        return String("\(formattedNumber)원")
    }
}

// 음식 이미지
// 음식 이름
// 음식 기본 가격
// 음식 기본 가격 + 선택한 메뉴 가격 = price
// 음식 개수
// 총 가격
// 선택한 메뉴들
