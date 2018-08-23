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
    
    let userModel = UserModel()
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func action(_ sender: UIButton) {
        if userModel.authenticate(email: emailText.text!, password: passwordText.text!, segment: segmentControl.selectedSegmentIndex) == true {
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }
//        if emailText.text != ""  && passwordText.text != ""
//        {
//            if segmentControl.selectedSegmentIndex == 0
//            {
//                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { ( user, error) in
//                    if user != nil
//                    {
//                        self.performSegue(withIdentifier: "segue", sender: self)
//                    }
//                    else
//                    {
//                        if let myError = error?.localizedDescription
//                        {
//                            print(myError)
//                        }
//                        else
//                        {
//                            print("ERROR")                        }
//                    }
//                })
//            }
//            else
//            {
//                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
//                    if user != nil
//                    {
//                        self.performSegue(withIdentifier: "segue", sender: self)
//                    }
//                    else
//                    {
//                        if let myError = error?.localizedDescription
//                        {
//                            print(myError)
//                        }
//                        else
//                        {
//                            print("ERROR")
//                        }
//                    }
//                })
//            }
//        }
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

