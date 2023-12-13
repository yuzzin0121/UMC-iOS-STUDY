//
//  LoginViewModel.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/12/13.
//

import Foundation

class LoginViewModel: ObservableObject {
    static var users: [User] {
        get {
            var users: [User]?
            if let data = UserDefaults.standard.value(forKey: "users") as? Data {
                users = try? PropertyListDecoder().decode([User].self, from: data)
                for user in users! {
                    print("\(user.id), \(user.password)")
                }
            }
            return users ?? []
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey:"users")
        }
    }
    @Published var user: User = User()
}
