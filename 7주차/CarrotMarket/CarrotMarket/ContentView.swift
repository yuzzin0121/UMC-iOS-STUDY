//
//  ContentView.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/11/13.
//

import SwiftUI

struct ContentView: View {
    init() {
      UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("홈")
                    Text("홈")
                        .foregroundColor(.black)
                }
            
            LifeView()
                .tabItem {
                    Image("동네생활")
                    Text("동네생활")
                        .foregroundColor(.black)
                }
            NearMeView()
                .tabItem {
                    Image("내근처")
                    Text("내 근처")
                        .foregroundColor(.black)
                }
            ChattingView()
                .tabItem {
                    Image("채팅")
                    Text("채팅")
                        .foregroundColor(.black)
                }
            MyCarrotView()
                .tabItem {
                    Image("나의당근")
                    Text("나의 당근")
                        .foregroundColor(.black)
                }

        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
