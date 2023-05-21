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
    
    private let userName = "root"
    private let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func tryLogin() {
        if userNameTextField.text == userName, passwordTextField.text == password {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            passwordTextField.text = ""
            let actionForAlert = UIAlertAction(title: "Try again", style: .default)
            showAlert(
                title: "Error!",
                message: "Wrong username or password",
                actions: [actionForAlert]
            )
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func remindData(_ sender: UIButton) {
        var remindAlertTitle = ""
        var remindAlertMessage = ""
        
        if sender.restorationIdentifier == "forgotUserNameButton" {
            remindAlertTitle = "Oops"
            remindAlertMessage = userName
        } else if sender.restorationIdentifier == "forgotPasswordButton" {
            remindAlertTitle = "Hm..."
            remindAlertMessage = password
        }
        
        let remindAlertButton = UIAlertAction(title: "Ok", style: .default)
        showAlert(
            title: remindAlertTitle,
            message: remindAlertMessage,
            actions: [remindAlertButton]
        )
    }
    
    private func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alertForShow = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            let alertAction = UIAlertAction(
                title: action.title,
                style: action.style
            )
            
            alertForShow.addAction(alertAction)
        }
        present(alertForShow, animated: true)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height / 5
            
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = -keyboardHeight
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
}

