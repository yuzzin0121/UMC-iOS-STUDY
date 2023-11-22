//
//  AddToCartViewModel.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import Foundation

class AddToCartViewModel: ObservableObject {
    @Published var food: Food
    @Published var cartMenu: CartMenu
    
    init(
        food: Food = .init(
            foodImageString: "떡볶잉",
            name: "신전떡볶이",
            description: "순한맛 중간맛 매운맛 선택 가능\n순한맛(신라면정도) 중간맛(불닭볶음면정도) 매운맛 선택 가능",
            reviewCount: 65,
            defaultPrice: 3500,
            itemMenus: [
                .init(
                    title: "맛 선택",
                    isEssential: true,
                    choiceItems: [
                        .init(title: "맛 선택",isSelected: true, name: "순한맛(신라면정도맵기)", price: 0),
                    .init(title: "맛 선택",name: "중간맛(불닭볶음면정도맵기)", price: 0),
                    .init(title: "맛 선택",name: "매운맛(더맵게불가능)", price: 0)
                    ]
                ),
                .init(
                    title: "토핑 추가선택",
                    isEssential: false,
                    selectionMaxCount: 5,
                    choiceItems: [
                        .init(title: "토핑 추가선택", name: "납작면", price: 2000),
                        .init(title: "토핑 추가선택", name: "분모자", price: 2500),
                        .init(title: "토핑 추가선택", name: "비엔나 5개", price: 1000),
                        .init(title: "토핑 추가선택", name: "베이컨 45g", price: 1000),
                        .init(title: "토핑 추가선택", name: "메추리알 4개", price: 1000)
                    ]
                ),
                .init(
                    title: "단무지추가 (기본으로 제공되지 않습니다.)",
                    isEssential: false,
                    selectionMaxCount: 1,
                    choiceItems: [
                        .init(title: "단무지추가 (기본으로 제공되지 않습니다.)", name: "단무지 1팩(170g)", price: 500),
                        .init(title: "단무지추가 (기본으로 제공되지 않습니다.)", name: "단무지 2팩", price: 1000),
                        .init(title: "단무지추가 (기본으로 제공되지 않습니다.)",name: "단무지3팩", price: 1500)
                    ]
                )
            
            ]),
        cartMenu: CartMenu = .init()
    ) {
        self.food = food
        self.cartMenu = cartMenu
    }
}

extension AddToCartViewModel {
    func selectBtnTapped(itemMenu: ItemMenu, choiceItem: ChoiceItem, isSelected: Bool) {
        if let itemMenuIndex = food.itemMenus.firstIndex(of: itemMenu) {
            var itemMenu = food.itemMenus[itemMenuIndex]
            
            if let choiceItemIndex = itemMenu.choiceItems.firstIndex(of: choiceItem) {
                itemMenu.choiceItems[choiceItemIndex].isSelected = isSelected
                food.itemMenus[itemMenuIndex] = itemMenu
                
                if isSelected {
                    addSelectedChoiceItem(choiceItem)
                } else {
                    removeSelectedChoiceItem(choiceItem)
                }
            }
        }
    }
    
    func addSelectedChoiceItem(_ choiceItem: ChoiceItem) {
        self.cartMenu.choiceItems.append(choiceItem)
        self.cartMenu.price += choiceItem.price
    }
    
    func removeSelectedChoiceItem(_ choiceItem: ChoiceItem) {
        if let index = cartMenu.choiceItems.firstIndex(of: choiceItem) {
            cartMenu.choiceItems.remove(at: index)
            cartMenu.price -= choiceItem.price
        }
    }
    
    func setCartMenu(foodImageString: String, foodName: String, defaultPrice: Int) {
        cartMenu.foodImageString = foodImageString
        cartMenu.foodName = foodName
        cartMenu.defaultPrice = defaultPrice
        cartMenu.price = defaultPrice
    }
}
