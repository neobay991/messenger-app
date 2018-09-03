//
//  Constants.swift
//  messenger-app
//
//  Created by Cornelis Heuperman on 20/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import Foundation
import Firebase

struct Constants {
    struct Refs {
        static let database = Auth.auth()
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("messenger-app")
    }
}
