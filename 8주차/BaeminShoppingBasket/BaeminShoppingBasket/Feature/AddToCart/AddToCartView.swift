//
//  AddToCartView.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/20.
//

import SwiftUI

struct AddToCartView: View {
    @EnvironmentObject var addToCartViewModel: AddToCartViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CustomNavigationBar()
                    Spacer()
                }
                .zIndex(1)
                
                VStack {
                    List {
                        Section {
                            FoodDescriptionView(food: addToCartViewModel.food)
                        }
                        .onTapGesture {return}
                        .listStyle(PlainListStyle())
                        .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        
                        
                        ForEach(addToCartViewModel.food.itemMenus, id: \.self) { itemMenu in
                            Section(header: Text("")) {
                                ItemMenuView(itemMenu: itemMenu)
                            }
                            .onTapGesture {return}
                        }
                        .listRowSeparator(.hidden)
                      
                    }
                    .onTapGesture {return}
                    .ignoresSafeArea(.all)
                    .listStyle(.grouped)
                    
                    PutFoodInCartBtnView()
                }
                .zIndex(0)
                
                
            }
            .onAppear {
                addToCartViewModel.setCartMenu(
                    foodImageString: addToCartViewModel.food.foodImageString,
                    foodName: addToCartViewModel.food.name,
                    defaultPrice: addToCartViewModel.food.defaultPrice
                )
            }
        }
        
    }
}

// 커스텀 네비게이션바
private struct CustomNavigationBar: View {
    fileprivate var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "arrow.backward")
                    
            })
            Spacer()
            HStack(spacing: 20) {
                Button(action: {}, label: {
                    Image(systemName: "house")
                })
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                })
                Button(action: {}, label: {
                    Image(systemName: "cart")
                })
            }
        }
        .font(.system(size: 20))
        .padding(.horizontal, 20)
        .foregroundColor(.black)
    }
}

// ( ) 선택
private struct FoodDescriptionView: View {
    @EnvironmentObject var addToCartViewModel: AddToCartViewModel
    @State var food: Food
    
    init(food: Food) {
        self.food = food
    }
    
    fileprivate var body: some View {
        VStack {
            Button(action: {}, label: {
                Image("떡볶이")
                    .resizable()
                    .frame(height: 250)
                    
            })
            VStack {
                HStack(spacing: 2) {
                    Image("인기")
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text(food.name)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                Text(food.description)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(3)
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(.secondary)
                    .padding(.trailing)
                
                Spacer()
                    .frame(height: 16)
                HStack {
                    Button(action: {}, label: {
                        HStack(spacing: 4) {
                            Image("review")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("매뉴 리뷰 \(food.reviewCount)개")
                                .font(.system(size: 17, weight: .bold))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12))
                            Spacer()
                        }
                    })
                }
                .foregroundColor(.black)
                HStack {
                    Text("가격")
                    Spacer()
                    Text(food.convertedPriceToString)
                }
                .font(.system(size: 18, weight: .bold))
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
        }
    }
}

private struct ItemMenuView: View {
    @EnvironmentObject var addToCartViewModel: AddToCartViewModel
    @State var itemMenu: ItemMenu
    @State var isSelected: Bool
    
    var backgroundColor: Color {
        if itemMenu.isEssential {
            return Color.customBackgroundLightBlue
        } else {
            return Color.customBackgroundLightGray
        }
    }
    
    var textColor: Color {
        if itemMenu.isEssential {
            return Color.customTextLightBlue
        } else {
            return Color.customTextLightGray
        }
    }
    
    init(itemMenu: ItemMenu, isSelected: Bool=false) {
        self.itemMenu = itemMenu
        self.isSelected = isSelected
    }
    
    fileprivate var body: some View {
        VStack {
            VStack(spacing: 6) {
                HStack(spacing: 4) {
                    Text(itemMenu.title)
                        .font(.system(size: 20, weight: .bold))
                        
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(backgroundColor)
                        .frame(width: 45, height: 28)
                        .overlay {
                            Text(itemMenu.isEssentialToString)
                                .foregroundColor(textColor)
                                .font(.system(size: 14, weight: .semibold))
                        }
                }
                HStack {
                    Text(itemMenu.selectionString ?? "")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            
            .padding(.vertical, 10)
            VStack {
                ForEach(itemMenu.choiceItems, id: \.self) { choiceItem in
                    ChoiceItemView(itemMenu: itemMenu, choiceItem: choiceItem)
                        .onTapGesture {
                            isSelected.toggle()
                            addToCartViewModel.selectBtnTapped(itemMenu: itemMenu, choiceItem: choiceItem, isSelected: isSelected)
                        }
                }
                
            }.foregroundColor(.black)
        }
        
    }
}

private struct ChoiceItemView: View {
    @EnvironmentObject var addToCartViewModel: AddToCartViewModel
    @State var itemMenu: ItemMenu
    @State var choiceItem: ChoiceItem
    @State var isSelected: Bool
    
    var choiceImageString: String {
        if itemMenu.isEssential && choiceItem.isSelected {
            return "selectedCircle"
        } else if itemMenu.isEssential && !choiceItem.isSelected {
            return "unSelectedCircle"
        }
        else if !itemMenu.isEssential && choiceItem.isSelected {
            return "selectedRectangle"
        } else if !itemMenu.isEssential && !choiceItem.isSelected {
            return "unSelectedRectangle"
        }
        else {
            return "unSelectedCircle"
        }
    }
    
    init(itemMenu: ItemMenu, choiceItem: ChoiceItem, isSelected: Bool=false) {
        self.itemMenu = itemMenu
        self.choiceItem = choiceItem
        self.isSelected = isSelected
    }
    
    fileprivate var body: some View {
        Button(
            action: {
                
            },
            label: {
            HStack {
                Image(choiceImageString)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                Text(choiceItem.name)
                    .font(.system(size: 18))
                Spacer()
                Text(choiceItem.convertedAddPrice)
                    .font(.system(size: 18, weight: .bold))
            }
        })
        .padding(.vertical, 10)
    }
}

private struct PutFoodInCartBtnView: View {
    @EnvironmentObject var addToCartViewModel: AddToCartViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    fileprivate var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 4) {
                Text("배달최소주문금액")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .light))
                
                Text("7,000원")
                    .font(.system(size: 16, weight: .regular))
            }
            
            NavigationLink(destination: CartView(cartMenu: addToCartViewModel.cartMenu), label: {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.customMint)
                    .frame(height: 50)
                    .overlay {
                        Text("\(addToCartViewModel.cartMenu.convertedPriceToString) 담기")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
            })
            
            
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 14)
    }
}


struct AddToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartView()
            .environmentObject(AddToCartViewModel())
            .environmentObject(CartViewModel())
    }
}
