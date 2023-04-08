//
//  LoginVC.swift
//  Artable-eCommerce
//
//  Created by Ayşegül Koçak on 6.04.2023.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let email = emailText.text, email.isNotEmpty,
              let password = passwordText.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error {
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            
            self.activityIndicator.startAnimating()
            print("Login was successfull")
        }
        
    }
    
    @IBAction func guestClicked(_ sender: Any) {
    }
    

}
