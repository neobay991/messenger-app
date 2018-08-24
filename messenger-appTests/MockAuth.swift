//
//  MockAuth.swift
//  messenger-appTests
//
//  Created by Cornelis Heuperman on 24/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import Foundation
import Firebase

class MockAuth : Auth {
    override func signIn(withEmail email: String, link: String, completion: AuthDataResultCallback? = nil) {
        return ()
    }
    
}
