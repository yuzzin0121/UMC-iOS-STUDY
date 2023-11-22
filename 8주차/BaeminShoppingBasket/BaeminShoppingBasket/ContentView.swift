//
//  ContentView.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AddToCartView()
            .environmentObject(AddToCartViewModel())
            .environmentObject(CartViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
