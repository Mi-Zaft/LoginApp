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
        setupUI()
        
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

extension PersonViewController {
    private func setupUI() {
        let gradientLayer = CAGradientLayer()
        let startColor = UIColor(
            red: 178 / 255,
            green: 125 / 255,
            blue: 239 / 255,
            alpha: 1
        )
        
        let endColor = UIColor(
            red: 125 / 255,
            green: 201 / 255,
            blue: 239 / 255,
            alpha: 1
        )
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}
