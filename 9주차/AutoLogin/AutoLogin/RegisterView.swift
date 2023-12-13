//
//  RegisterView.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/12/13.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var registerViewModel: RegisterViewModel = RegisterViewModel()
    @State var message = ""
    @State var id = ""
    @State var password = ""

    
    var body: some View {
        NavigationView {
            VStack {
                Text("회원가입")
                    .font(.title.bold())
                Spacer()
                    .frame(height: 70)
                
                Text(message)
                    .font(.body)
                    .foregroundColor(.red)
                customTextField(title: "아이디를 입력하세요.", text: $id)
                customTextField(title: "비밀번호를 입력하세요.", text: $password)
                
                Spacer()
                    .frame(height: 18)
                
                Button(
                    action: {
                       didTapRegisterBtn()
                    }
                ,
                    label: {
                    RoundedRectangle(cornerRadius: 16)
                            .fill(.orange.opacity(0.7))
                            .frame(width: 300, height: 50)
                            .overlay {
                                Text("회원가입")
                                    .foregroundColor(.white)
                            }
                        
                })
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarTitle("회원가입")
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
    
    
    func didTapRegisterBtn() {
        guard !id.isEmpty && !password.isEmpty else {
            message = "아이디와 비밀번호를 입력해주세요."
            return
        }
        
        registerViewModel.user.id = id
        registerViewModel.user.password = password
        
        for listUser in RegisterViewModel.users {
            if listUser.id == registerViewModel.user.id {
                message = "이미 존재하는 아이디입니다."
                print("아이디 중복됨")
                return
            }
        }
        
        registerViewModel.addUser(registerViewModel.user)
        print("sdsdf")
        message = "회원가입 완료"
        self.presentationMode.wrappedValue.dismiss()
        
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
