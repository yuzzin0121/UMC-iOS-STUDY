//
//  PostListViewModel.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/11/13.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts: [Post]
    @Published var posts2: [Post2]
    
    init(posts: [Post] = [
        .init(imageString: "img1", title: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ - 🧅", location: "당근알바 • 이벤트", price: nil),
        .init(imageString: "img2", title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구 • 1일전", price: "550,000원"),
        .init(imageString: "img3", title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", location: "서울특별시 양천구 • 3시간 전", price: "490,000원"),
        .init(imageString: "img5", title: "애어팟 맥스 블랙 판매합니다", location: "광명동 • 3일 전", price: "370,000원")
    ], posts2: [Post2] = [
        .init(imageString: "img6", title: "스팸", price: "30,000원"),
        .init(imageString: "img7", title: "스팸 8호", price: "24,000원"),
        .init(imageString: "img8", title: "청정원 종합선물세트 특석 2호 + 선물가방", price: "50,000원"),
        .init(imageString: "img9", title: "신양촌 간장 선물세트 판매합니다!", price: "27,000원"),
        .init(imageString: "img9", title: "cj 스팸선물세트 + 선물가방", price: "27,000원"),
        .init(imageString: "img10", title: "정관장 홍삼진건 세트 + 선물가방", price: "45,000원"),
        .init(imageString: "img11", title: "스팸복합1호 2개 판매합니다", price: "34,000원"),
        .init(imageString: "img12", title: "[새상품]오설록 프리미엄 티 컬렉션 티세트 선물세트", price: "45,000원"),
        .init(imageString: "img12", title: "선물세트", price: "7,000원")
    ]) {
        self.posts = posts
        self.posts2 = posts2
    }
}
