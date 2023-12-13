//
//  RegisterViewModel.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/12/13.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var user: User = User()
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
    
    
    
    func addUser(_ user: User) {
        RegisterViewModel.users.append(user)
    }
}
