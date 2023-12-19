//
//  KakaoAuthViewModel.swift
//  KakaoLoginSwiftUI
//
//  Created by 조유진 on 12/20/23.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthViewModel: ObservableObject {
    @Published var isLoggedIn : Bool = false
    
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }
    
    func handleLoginWithKakaoTalkApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk { (oAuthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // do something
                    _ = oAuthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            // 카카오 웹뷰로 로그인
            UserApi.shared.loginWithKakaoAccount { (oAuthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning:  false)
                } else {
                    print("loginWithKakaoAccount() success.")
                    
                    // do something
                    
                    let userInfo = oAuthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    @MainActor
    func handleKakaoLogin() {
        Task {
            // 카카오톡 설치 여부 확인 - 설치 되어있을 떄
            if (UserApi.isKakaoTalkLoginAvailable()) {
                
                // 카카오톡 앱을 통해 로그인
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else { // 설치 안되어있을 때
                // 카카오 웹뷰로 로그인
                isLoggedIn = await handleLoginWithKakaoAccount()
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.logout { (error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                } else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
}
