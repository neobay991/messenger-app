//
//  LoginViewController.swift
//  messenger-app
//
//  Created by M Jawad Khan on 29/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func logIn(_ sender: UIButton) {
        let email = emailText.text!
        let password = passwordText.text!
        Constants.Refs.database.signIn(withEmail: email, password: password, completion: { ( user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "Log in successful", sender: self)
            }
            else {
                let alertMessage = error?.localizedDescription ?? "Please enter a valid email address an password"
                let alert = UIAlertController(title: "Failed to log in", message: alertMessage, preferredStyle: .alert)
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
