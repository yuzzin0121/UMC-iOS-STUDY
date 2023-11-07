//
//  HomeView.swift
//  TheDeliveryPeople
//
//  Created by 조유진 on 2023/11/06.
//

import SwiftUI


struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar()
            ScrollView(.vertical) {
                VStack {
                    SearchView()
                    Spacer()
                        .frame(height: 14)
                    MenuView(homeViewModel: homeViewModel)
                        
                }
               
            }
            .background(Color.customBackgroundGray)
         
            TabBarView(homeViewModel: homeViewModel)
            
        }
        
    }
}

private struct CustomNavigationBar: View {
    fileprivate var body: some View {

        HStack {
            Button {
                
            } label: {
                HStack(spacing: 0) {
                    Text("우리집")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .black))
                    Image("arrow_drop_down")
                }
            }
            
            Spacer()
            
            HStack(spacing: 6) {
                Button(action: {}, label: {
                    Image("menu")
                })
                Button(action: {}, label: {
                    Image("bell")
                })
                Button(action: {}, label: {
                    Image("cart")
                })
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 4)
        .background(Color.customMint)
        
        
    }
}

private struct SearchView: View {
    fileprivate var body: some View {
        HStack{
            Rectangle()
                .fill(.white)
                .cornerRadius(4)
                .shadow(radius: 1)
                .overlay(alignment: .leading) {
                    Label{
                        Text("찾는 메뉴가 뭐예요?")
                            .foregroundColor(.customTextGray)
                    } icon: {
                        Image("검색아이콘")
                    }
                    .padding(.leading, 14)
                }
        }
        .frame(height: 42)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .background(Color.customMint)
        .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
    }
}

private struct MenuView: View {
    @ObservedObject private var homeViewModel: HomeViewModel
    fileprivate init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    fileprivate var body: some View {
        VStack(spacing: 14) {
            // 배달, 배민스토어, 대용량특가
            LazyHGrid(rows: [GridItem(spacing: 0, alignment: .center)], alignment: .center, spacing: 12) {
                ForEach(Array(homeViewModel.menus.enumerated()), id: \.element) {
                    index, menu in
                    MenuCellView(menu: menu)
                }
            }
            
            // 음식 메뉴 주문
            VStack {
                HStack {
                    Text("알뜰,한집배달")
                        .font(.bmHannaPro)
                    Text("배민1")
                        .font(.subheadline).bold()
                    Text("원하는 대로 골라 주문!")
                        .font(.subheadline)
                    Spacer()
                    Button(action: {}, label: {
                        Image("right_arrow")
                    })
                }
                // 메뉴 선택뷰
                LazyVGrid(columns: Array(repeating: GridItem(), count: 5)) {
                    ForEach(Array(homeViewModel.foodMenus.enumerated()), id: \.element) { index, foodMenu in
                        FoodMenuCellView(foodMenu: foodMenu)
                    }
                }
            }
            .padding(14)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 10)
            .padding(.horizontal, 16)
            
            // 광고배너
            Button(action: {}, label: {
                Image("할인광고")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width-14)
                    
            })
            
            // 다른 메뉴: 포장, 전국별미, 선물하기
            HStack(alignment: .top) {
                LazyHGrid(rows: [GridItem()], spacing: 16) {
                    ForEach(Array(homeViewModel.otherMenus.enumerated()), id: \.element) { index, otherMenu in
                        OtherMenuCellView(otherMenu: otherMenu)
                    }
                }
                .padding(.horizontal, 14)
                Spacer()
                    
            }
            .frame(width: UIScreen.main.bounds.width, height: 130)
            .background(Color.white)
            
            
            
        }
        
        
   }
}

private struct MenuCellView: View {
    private var menu: Menu
    
    fileprivate init(menu: Menu) {
        self.menu = menu
    }
    
    fileprivate var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(menu.title)
                    .font(.bmHannaPro)
                    .lineLimit(0)
                Text(menu.subTitle)
                    .font(.subheadline)
                Spacer()
            }
            Spacer()
        }
        .padding([.top, .leading], 12)
        .frame(width: (UIScreen.main.bounds.size.width/3)-18, height: (UIScreen.main.bounds.size.width/3)-18)
        .background(.white)
        .overlay(alignment: .bottomTrailing) {
            Image(menu.imageFileName)
        }
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 10)
    }
}

private struct FoodMenuCellView: View {
    fileprivate var foodMenu: FoodMenu
    
    fileprivate init(foodMenu: FoodMenu) {
        self.foodMenu = foodMenu
    }
    
    fileprivate var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.customBtnGray)
                .overlay {
                    Image(foodMenu.imageFileName)
                        .shadow(radius: 3)
                }
                .frame(width: (UIScreen.main.bounds.size.width/4)-48, height: (UIScreen.main.bounds.size.width/4)-48)
                
            Text(foodMenu.name)
                .font(.caption)
        }
    }
}

private struct OtherMenuCellView: View {
    fileprivate var otherMenu: FoodMenu
    
    fileprivate init(otherMenu: FoodMenu) {
        self.otherMenu = otherMenu
    }
    
    fileprivate var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.customBtnGray)
                .frame(width: 70, height: 70)
                .border(Color.customBtnBorderGray, width: 2)
                .cornerRadius(28)
                .overlay {
                    Image(otherMenu.imageFileName)
                        .shadow(radius: 3)
                }
                
            Text(otherMenu.name)
                .font(.subheadline)
        }
    }
}

private struct TabBarView: View {
    @ObservedObject private var homeViewModel: HomeViewModel
    
    fileprivate init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }

    fileprivate var body: some View {
        ZStack {
            LazyHGrid(rows: [GridItem()], alignment: .center, spacing: 20) {
                ForEach(Array(homeViewModel.tabItems.enumerated()), id: \.element) { index, tabItem in
                    TabCellView(tabItem: tabItem)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width,height: 80)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(color: Color.gray ,radius: 6)
        .ignoresSafeArea(edges: .vertical)
        .background(.white)
    
        

    }
}
                        
private struct TabCellView: View {
    fileprivate var tabItem: TabItem
    
    fileprivate init(tabItem: TabItem) {
        self.tabItem = tabItem
    }
    
    fileprivate var body: some View {
        Button(action: {}, label: {
            VStack {
                Image(tabItem.imageFileName)
                    .clipped()
                    
                Text(tabItem.name ?? "")
                    .foregroundColor(.customTextGray2)
                    .font(.caption)
                    .clipped()
            }
            
        })
        .frame(width: 52)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
