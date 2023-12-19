//
//  ContentView.swift
//  KakaoLoginSwiftUI
//
//  Created by 조유진 on 12/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthViewModel: KakaoAuthViewModel = KakaoAuthViewModel()
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(loginStatusInfo(kakaoAuthViewModel.isLoggedIn))
            
            Button(
                action: {
                    kakaoAuthViewModel.handleKakaoLogin()
                },
                label: {
                Text("카카오 로그인")
                        .bold()
            })
            .padding()
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(14)
            
            
            Button(
                action: {
                    kakaoAuthViewModel.kakaoLogout()
                },
                label: {
                Text("카카오 로그아웃")
                        .bold()
            })
            .padding()
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(14)
            
        }
    }
}

#Preview {
    ContentView()
}
