//
//  RegisterVC.swift
//  Artable-eCommerce
//
//  Created by Ayşegül Koçak on 6.04.2023.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailText.text, !email.isEmpty,
              let username = usernameText.text, !username.isEmpty,
              let password = passwordText.text, !password.isEmpty else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                debugPrint(error)
                return
            }
            print("successfully registered new user")
        }
        
    }
    
}
