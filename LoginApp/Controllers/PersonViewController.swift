//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Максим Евграфов on 27.05.2023.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var avatarImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        
        avatarImage.image = UIImage(named: person.avatarName)
        nameLabel.text = "\(person.name) \(person.surname)"
        ageLabel.text = "\(person.age) years old"
    }
    
    override func viewDidLayoutSubviews() {
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        avatarImage.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jobVC = segue.destination as? JobViewController else { return }
        jobVC.job = person.job
    }
}
