//
//  ViewController.swift
//  messenger-app
//
//  Created by Jay Khan on 20/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderID: String!, senderDisplayName: String!, date: Date!) {
        
        let ref = Constants.refs.databaseChats.childByAutoId()
        
        let message = ["sender_id": senderID, "name": senderDisplayName, "text": text]
        
        ref.setValue(message)
        
        finishSendingMessage()
    }

}


