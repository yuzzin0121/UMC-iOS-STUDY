//
//  File.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import Foundation

struct ItemMenu: Hashable {
    var title: String
    var isEssential: Bool
    var isEssentialToString: String {
        if isEssential {
            return String("필수")
        } else {
            return String("선택")
        }
    }
    var selectionMaxCount: Int?
    var selectionString: String? {
        if selectionMaxCount == nil {
            return nil
        } else {
            return String("최대 \(selectionMaxCount!)개 선택")
        }
    }
    var choiceItems: [ChoiceItem]
    
    init(title: String, isEssential: Bool, selectionMaxCount: Int? = nil, choiceItems: [ChoiceItem]) {
        self.title = title
        self.isEssential = isEssential
        self.selectionMaxCount = selectionMaxCount
        self.choiceItems = choiceItems
    }
}
