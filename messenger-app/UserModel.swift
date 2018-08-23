//
//  UserModel.swift
//  messenger-app
//
//  Created by Cornelis Heuperman on 23/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import Foundation
import Firebase

class UserModel {
    
    func authenticate(email: String, password: String, segment: Int) -> Bool {
        
        enum MyError: Error {
            case runtimeError(String)
        }
        
        if email != ""  && password != ""
                {
                    if segment == 0
                    {
                        Auth.auth().signIn(withEmail: email, password: password, completion: { ( user, error) in
                            if user = nil
                            {
                                throw FailedSignIn.runtimeError("Failed")
                            }
                        })
                    }
                    else
                    {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if user != nil
                            {
                                return true
                            }
                            else
                            {
                                return false
                            }
                        })
                    }
                }
            }
    }

