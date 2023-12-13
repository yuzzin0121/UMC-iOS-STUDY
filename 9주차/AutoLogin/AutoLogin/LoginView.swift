//
//  LoginView.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/12/13.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @State var message = "Welcome!"
    @State var id = ""
    @State var password = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 14) {
                Text(message)
                    .font(.title.bold())
                Spacer()
                    .frame(height: 18)
                
                customTextField(title: "아이디를 입력하세요.", text: $id)
                customTextField(title: "비밀번호를 입력하세요.", text: $password)
                
                Spacer()
                    .frame(height: 18)
                
                // 로그인 버튼
                Button(
                    action: {
                        didTapLoginBtn()
                    }
                ,
                    label: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.orange.opacity(0.7))
                            .frame(width: 300, height: 50)
                            .overlay {
                                Text("로그인")
                                    .foregroundColor(.white)
                            }
                })
                
                // 회원가입 버튼
                Button(
                    action: {}
                ,
                    label: {
                        NavigationLink(destination: RegisterView()) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.orange.opacity(0.7))
                                .frame(width: 300, height: 50)
                                .overlay {
                                    Text("회원가입")
                                        .foregroundColor(.white)
                                }
                        }
                })
                
                
            }
        }
        .navigationBarTitle("로그인")
    }
    
    // 텍스트 필드
    func customTextField(title: String, text: Binding<String>) -> some View {
        TextField(title, text: text)
            .padding(.horizontal, 10)
            .frame(width: 300, height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray)
            }
           
            
    }
   
    
    // 로그인 버튼 눌렀을 때
    func didTapLoginBtn() {
        var isExistId = false
        guard !id.isEmpty && !password.isEmpty else {
            message = "아이디와 비밀번호를 입력해주세요."
            return
        }
        
        loginViewModel.user.id = id
        loginViewModel.user.password = password
        
        if LoginViewModel.users.isEmpty {
            message = "아이디 또는 비밀번호가 불일치합니다."
        }
        
        for user in LoginViewModel.users {
            if user.id == loginViewModel.user.id {
                isExistId = true
                if user.password == loginViewModel.user.password {
                    message = "로그인 성공"
                    return
                }
                else if user.password != loginViewModel.user.password{
                    message = "비밀번호가 불일치합니다."
                    return
                }
                
            }
        }
        
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
