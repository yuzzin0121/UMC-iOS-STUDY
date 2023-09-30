//
//  MyItem.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/29.
//

import UIKit

enum MyItem: Equatable {
    case tableItem(TableItem)    // tableview item
    case collectionItem([CollectionItem])   // collectionview item
}
