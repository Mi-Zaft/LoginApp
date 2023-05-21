//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Максим Евграфов on 22.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeMessage: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        welcomeMessage.text = "Welcome \(userName)!"
    }
    
    private func setupUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        let startColor = UIColor(red: 178 / 255, green: 125 / 255, blue: 239 / 255, alpha: 1).cgColor
        let endColor = UIColor(red: 125 / 255, green: 201 / 255, blue: 239 / 255, alpha: 1).cgColor
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}
