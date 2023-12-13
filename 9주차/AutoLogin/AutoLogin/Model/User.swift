//
//  User.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/12/13.
//
 
import Foundation

struct User: Codable {
    var id: String
    var password: String
    
    init(id: String="", password: String="") {
        self.id = id
        self.password = password
    }
}
