//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Максим Евграфов on 22.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeMessage: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        
        welcomeMessage.text = "Welcome, \(user.person.name)!"
    }
}
