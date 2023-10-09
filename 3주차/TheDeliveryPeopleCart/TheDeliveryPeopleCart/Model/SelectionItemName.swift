//
//  SelectionName.swift
//  TheDeliveryPeopleCart
//
//  Created by 조유진 on 2023/10/03.
//

import UIKit

struct SelectionItemName {
    var selectionKind: String   // 메뉴 선택, 맛 선택
    var isEssential: Bool   // 필수 여부(불린)
    var isEssentialString: String { // "필수" or "선택"
        if(isEssential){ return "필수" }
        else { return "선택" }
    }
    var selectionItems: [SelectionItem]!
    init(selectionKind: String, isEssential: Bool, selectionItems: [SelectionItem]!) {
        self.selectionKind = selectionKind
        self.isEssential = isEssential
        self.selectionItems = selectionItems
    }
}
