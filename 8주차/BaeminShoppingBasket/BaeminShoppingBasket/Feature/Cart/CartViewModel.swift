//
//  CartViewModel.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/21.
//

import Foundation

class CartViewModel: ObservableObject {

    @Published var cartMenus: [CartMenu]
    @Published var totalPrice: Int = 0
    var menuCount: Int {
        return cartMenus.count
    }
    
    init(cartMenus: [CartMenu] = []) {
        self.cartMenus = cartMenus
    }
}

extension CartViewModel {
    func addCartMenu(_ cartMenu: CartMenu) {
        self.cartMenus.append(cartMenu)
        self.totalPrice += cartMenu.totalPrice
    }
}
