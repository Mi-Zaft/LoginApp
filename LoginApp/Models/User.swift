//
//  User.swift
//  LoginApp
//
//  Created by Максим Евграфов on 27.05.2023.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "root",
            password: "password",
            person: Person.getPerson()
        )
    }
}
