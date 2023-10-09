//
//  SelectionItem.swift
//  AddToCart
//
//  Created by 조유진 on 2023/10/09.
//

import UIKit

struct SelectionItem {
    var isEssential: Bool   // 필수 or 선택 (불린)
    var isChecked: Bool  // 선택버튼 이미지 이름 (선택안됨 or 선택됨)
    var checkImage: UIImage? {  // 선택버튼 이미지(O or 0)
        if(isEssential) {   // 필수일 경우
            if(isChecked){ return UIImage(named: "체크동글") }
            else { return UIImage(named: "노체크동글") }
        }
        else {  // 선택일 경우
            if(isChecked){ return UIImage(named: "체크네모") }
            else { return UIImage(named: "노체크네모") }
        }
    }
    var selectionMenu: String   // 선택할 메뉴 이름
    var priceValue: String  // 메뉴 가격값
    
    init(isEssential: Bool, isChecked: Bool, selectionMenu: String, priceValue: String) {
        self.isEssential = isEssential
        self.isChecked = isChecked
        self.selectionMenu = selectionMenu
        self.priceValue = priceValue
    }
}

