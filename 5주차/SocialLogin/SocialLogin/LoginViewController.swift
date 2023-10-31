//
//  ViewController.swift
//  SocialLogin
//
//  Created by 조유진 on 2023/10/31.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapKakoLogin(_ sender: UIButton) {
        startKakaoLogin()
    }
    
    func startKakaoLogin() {
        //카카오톡 설치된 경우 카톡 실행
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    _ = oauthToken
                    self.setUserInfo()
                }
            }
        }
        else {
            UserApi.shared.loginWithKakaoAccount(prompts:[.Login]) { oauthToken, error  in
                UserApi.shared.me() { [weak self] user, error in
                                
                if error == nil {
                    let userId = String(describing: user?.id)
                    print("userID: ",userId)
                    self?.setUserInfo()
                }
                
                }
            }
        }
    }
    
    func setUserInfo() {
        UserApi.shared.me {(user, error) in
            if let error = error {
                print(error)
            } else {
                print(#function)
               
                let nickname = user?.kakaoAccount?.profile?.nickname
                guard let urlString = user?.kakaoAccount?.profile?.profileImageUrl else{
                    print("url 없음")
                    return
                }
                print("닉네임: \(nickname), 이미지 주소: \(urlString)")
           
                self.nicknameLabel.text = nickname
                self.profileImageView.load(url: urlString)
               
            }
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
