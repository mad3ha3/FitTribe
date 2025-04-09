//
//  User.swift
//  disso
//
//  Created by Madeha Ahmed on 07/04/2025.
//

import Foundation

struct User: Identifiable, Codable{ //Codable protocol allows  us to take the incoming raw data and map it into a data object, 
    let id: String
    let fullname: String
    let email: String
    
    var intials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Test One", email: "test@egmail.com")
}
