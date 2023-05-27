//
//  ViewController.swift
//  LoginApp
//
//  Created by Максим Евграфов on 21.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            }
            else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController
                
                guard let personVC = personVC as? PersonViewController else { return }
                personVC.person = user.person
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func tryLogin() {
        guard userNameTextField.text == user.userName, passwordTextField.text == user.password else {
            showAlert(
                title: "Error auth!",
                message: "Wrong username or password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func remindData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user.userName)")
        : showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alertForShow = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actionForAlert = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alertForShow.addAction(actionForAlert)
        present(alertForShow, animated: true)
    }
}

