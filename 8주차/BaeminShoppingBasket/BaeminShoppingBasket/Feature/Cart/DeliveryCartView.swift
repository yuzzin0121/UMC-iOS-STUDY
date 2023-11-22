//
//  DeliveryCartView.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/22.
//

import SwiftUI

struct DeliveryCartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            
            List {
                Section {
                    ForEach(cartViewModel.cartMenus, id: \.self) { cartMenu in
                        CartMenuCellView(cartMenu: cartMenu)
                    }
                }
                
                
            }
            .listStyle(PlainListStyle())
            .onTapGesture {return}
            
            orderDeliveryBtnView()
        }
    }
}
private struct orderDeliveryBtnView: View {
    @EnvironmentObject var cartViewModel: CartViewModel

    fileprivate var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(.gray)
                    .frame(height: 0.5)
            }
            
            Button(action: {}, label: {
                HStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 24, height: 24)
                        .backgroundStyle(.white)
                        .overlay {
                            Text("\(cartViewModel.cartMenus.count)")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.customMint)
                        }
                    Spacer()
                    Text("배달 주문하기")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    Text("\(cartViewModel.totalPrice)원")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color.customMint)
                .padding(10)
                .cornerRadius(4, corners: .allCorners)
            })
            
            
        }
        .background(.white)
        .onAppear {
            print("\(cartViewModel.cartMenus.count)개")
            print("\(cartViewModel.totalPrice)원")
        }
    }
}

private struct CartMenuCellView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var cartMenu: CartMenu
    @State var priceValue: Int = 0
    
    init(cartMenu: CartMenu) {
        self.cartMenu = cartMenu
    }
    
    func incrementStep() {
        priceValue += 1
//        cartMenu.menuCount = priceValue
    }

    func decrementStep() {
        priceValue -= 1
        if priceValue < 1 { priceValue = 1 }
//        cartMenu.menuCount = priceValue
    }
    
    fileprivate var body: some View {
        VStack {
            HStack {
                Text("\(cartMenu.foodName)")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                
                Button(action: {}, label: {
                    Image("x")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.black)
                })
            }
            
            HStack(alignment: .top, spacing: 12) {
                Image(cartMenu.foodImageString)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading, spacing: 4) {
                    Text("• 가격 : \(cartMenu.convertPriceToString(cartMenu.defaultPrice))")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    ForEach(cartMenu.choiceItems, id: \.self) { choiceItem in
                        Text("• \(choiceItem.title) : \(choiceItem.name) \(choiceItem.formattedAddPrice)")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    }
                    Spacer()
                        .frame(height: 6)
                    Text("\(cartMenu.convertedPriceToString)")
                        .font(.system(size: 16, weight: .medium))
                    
                }
                Spacer()
            }
            
            HStack(spacing: 6) {
                Spacer()
                Spacer()
                Button(action: {}, label: {
                    Text("옵션변경")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 0.3)
                        }
                })
                
                Stepper {
                } onIncrement: {
                    incrementStep()
                } onDecrement: {
                    decrementStep()
                }
                .padding(5)
                .frame(width: 100)
            }
            .padding(12)
        }
    }
}

//struct DeliveryCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeliveryCartView()
//    }
//}
