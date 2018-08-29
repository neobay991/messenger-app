//
//  ViewController.swift
//  Test
//
//  Created by Cornelis Heuperman on 21/08/2018.
//  Copyright © 2018 Cornelis Heuperman. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController {
    let database = Auth.auth()
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
//    @IBAction func signUp(_ sender: UIButton) {
//        let username = usernameText.text!
//        let email = emailText.text!
//        let password = passwordText.text!
//        database.createUser(withEmail: email, password: password, completion: { (user, error) in
//            if user != nil {
//                let changeRequest = self.database.currentUser?.createProfileChangeRequest()
//                changeRequest?.displayName = username
//                changeRequest?.commitChanges { (error) in
//                    if error != nil {
//                        print(error!.localizedDescription)
//                    }
//                }
//                self.performSegue(withIdentifier: "Sign up successful", sender: self)
//            } else {
//                let alertMessage = error?.localizedDescription ?? "Please enter a valid email address an password"
//                let alert = UIAlertController(title: "Failed to sign up", message: alertMessage, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.present(alert, animated: true)
//            }
//        })
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}
