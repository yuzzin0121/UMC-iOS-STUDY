//
//  HomeViewModel.swift
//  TheDeliveryPeople
//
//  Created by 조유진 on 2023/11/07.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var menus: [Menu]
    @Published var foodMenus: [FoodMenu]
    @Published var otherMenus: [FoodMenu]
    @Published var tabItems: [TabItem]
    
    init(
        menus: [Menu] = [
            .init(imageFileName: "배달냥", title: "배달", subTitle: "요즘 배민 맛집은?"),
            .init(imageFileName: "배민스토어", title: "배민스토어", subTitle: "배달은 지금 옵니다"),
            .init(imageFileName: "대용량특가", title: "대용량특가", subTitle: "많이 살수록 저렴하죠")
        ],
        foodMenus: [FoodMenu] = [
            .init(imageFileName: "알뜰배달", name: "알뜰배달"),
            .init(imageFileName: "족발", name: "족발•보쌈"),
            .init(imageFileName: "회", name: "돈까스•회"),
            .init(imageFileName: "피자", name: "피자"),
            .init(imageFileName: "중식", name: "중식"),
            .init(imageFileName: "치킨", name: "치킨"),
            .init(imageFileName: "버거", name: "버거"),
            .init(imageFileName: "분식", name: "분식"),
            .init(imageFileName: "디저트", name: "디저트"),
            .init(imageFileName: "전체보기", name: "전체보기")
        ],
        otherMenus: [FoodMenu] = [
            .init(imageFileName: "포장", name: "포장"),
            .init(imageFileName: "전국별미", name: "전국별미"),
            .init(imageFileName: "선물하기", name: "선물하기")
        ],
        tabItems: [TabItem] = [
            .init(imageFileName: "검색", name: "검색"),
            .init(imageFileName: "찜", name: "찜"),
            .init(imageFileName: "배민홈", name: nil),
            .init(imageFileName: "주문내역", name: "주문내역"),
            .init(imageFileName: "my배민", name: "my배민")
        ]
    
    ) {
        self.menus = menus
        self.foodMenus = foodMenus
        self.otherMenus = otherMenus
        self.tabItems = tabItems
    }
}
