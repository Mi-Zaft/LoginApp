//
//  Hobbies.swift
//  LoginApp
//
//  Created by Максим Евграфов on 27.05.2023.
//

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
