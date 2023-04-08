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
    
    @IBOutlet weak var passCheckImage: UIImageView!
    
    @IBOutlet weak var confirmPassCheckImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    
    }
    
    @objc func textFieldDidChange(_ textField : UITextField) {
        //print("I got typed in")
        
        guard let passText = passwordText.text else { return }
        
        //If we have started typimg in he confirm pass text field
        if textField == confirmPasswordText {
            passCheckImage.isHidden = false
            confirmPassCheckImage.isHidden = false
        } else {
            if passText.isEmpty {
                passCheckImage.isHidden = true
                confirmPassCheckImage.isHidden = true
                confirmPasswordText.text = ""
            }
        }
        
        //Make it so when the passwords match, the checköarks turn green
        if passwordText.text == confirmPasswordText.text {
            passCheckImage.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImage.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImage.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImage.image = UIImage(named: AppImages.RedCheck)
        }
    }
    

    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailText.text, email.isNotEmpty,
              let username = usernameText.text, username.isNotEmpty,
              let password = passwordText.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            print("successfully registered new user ")
        }
        
    }
    
}
