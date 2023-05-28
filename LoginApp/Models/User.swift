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

struct Person {
    let name: String
    let surname: String
    let age: Int
    let avatarName: String
    let job: Job
    
    static func getPerson() -> Person {
        Person(
            name: "Maxim",
            surname: "Evgrafov",
            age: 27,
            avatarName: "avatar",
            job: Job.getJob()
        )
    }
}

struct Job {
    let title: String
    let position: String
    let experience: Double
    let technologies: [String]
    
    static func getJob() -> Job {
        Job(
            title: "Programmer",
            position: "Middle web developer",
            experience: 5.5,
            technologies: [
                "PHP",
                "Laravel",
                "MySQL",
                "Postgresql",
                "Docker",
                "Git",
                "Linux",
                "JavaScript",
                "VueJS",
                "NodeJS"
            ]
        )
    }
}
