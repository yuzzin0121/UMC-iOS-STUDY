//
//  CartView.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = PoCTribeTabViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @State var cartMenu: CartMenu
    
    init(cartMenu: CartMenu) {
        self.cartMenu = cartMenu
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar()
            CustomTabView(
                views: [
                    .one: AnyView(DeliveryCartView()) ,
                    .two: AnyView(Text("")),
                    .three: AnyView(Text("")),
                    .four: AnyView(Text(""))
                ],
                selection: $viewModel.selectedTab
            )
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            cartViewModel.addCartMenu(cartMenu)
        }
    }
}

// 커스텀 네비게이션바
private struct CustomNavigationBar: View {
    @Environment(\.dismiss) private var dismiss
    fileprivate var body: some View {
        HStack {
            Button(
                action: {
                    dismiss()
                },
                label: {
                    Image(systemName: "arrow.backward")
                }
            )
            Spacer()
            HStack(spacing: 20) {
                Button(action: {}, label: {
                    Image(systemName: "house")
                })
                Button(action: {}, label: {
                    Image(systemName: "person.badge.plus")
                })
            }
        }
        .font(.system(size: 20))
        .padding(.horizontal, 20)
        .foregroundColor(.black)
    }
}



//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView(cartMenu: CartMenu)
//    }
//}
