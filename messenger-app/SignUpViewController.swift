//
//  SignUpViewController.swift
//  messenger-app
//
//  Created by Jay Khan on 29/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
        let username = usernameText.text!
        let email = emailText.text!
        let password = passwordText.text!
        Constants.Refs.database.createUser(withEmail: email, password: password, completion: { (user, error) in
            if user != nil {
                let changeRequest = Constants.Refs.database.currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
                self.performSegue(withIdentifier: "Sign up successful", sender: self)
            } else {
                let alertMessage = error?.localizedDescription ?? "Please enter a valid email address an password"
                let alert = UIAlertController(title: "Failed to sign up", message: alertMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}
