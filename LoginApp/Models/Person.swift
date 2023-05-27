//
//  Person.swift
//  LoginApp
//
//  Created by Максим Евграфов on 27.05.2023.
//

struct Person {
    let name: String
    let surname: String
    let age: Int
    let job: Job
    
    static func getPerson() -> Person {
        Person(
            name: "Maxim",
            surname: "Evgrafov",
            age: 27,
            job: Job.getJob()
        )
    }
}
