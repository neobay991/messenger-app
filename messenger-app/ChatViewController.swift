//
//  ViewController.swift
//  messenger-app
//
//  Created by Jay Khan on 20/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Firebase

class ChatViewController: JSQMessagesViewController {

    var messages = [JSQMessage]()
    
    // this var is required to initially store the channel the user selects
    var channelParam = String()

    var handle: AuthStateDidChangeListenerHandle?

    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }()

    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard

        // get users firebase User UID
        let userID = Auth.auth().currentUser!.uid
        
        // set selected channel to a constant
        let selectedChannel = channelParam

        if  let id = defaults.string(forKey: "jsq_id"),
            let name = defaults.string(forKey: "jsq_name") {

            senderId = id
            senderDisplayName = name

        } else {

            // senderID should be users firebase User UID
            senderId = userID
            senderDisplayName = ""

            defaults.set(senderId, forKey: "jsq_id")
            defaults.synchronize()
        }

        inputToolbar.contentView.leftBarButtonItem = nil
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero

        let query = Constants.Refs.databaseChats.queryLimited(toLast: 20)

        _ = query.observe(.childAdded, with: { [weak self] snapshot in

            if  let data        = snapshot.value as? [String: String],
                let id          = data["sender_id"],
                let name        = data["name"],
                let text        = data["text"],
                let channel     = data["channel"],
                !text.isEmpty {

                if let message = JSQMessage(senderId: id, displayName: name, text: text), channel == selectedChannel {

                    self?.messages.append(message)

                    self?.finishReceivingMessage()
                }
            }
        })
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
            return messages[indexPath.item].senderId == senderId ? 0 : 15
    }

    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!)
        
    {
        let ref = Constants.Refs.databaseChats.childByAutoId()
        let name = Auth.auth().currentUser!.displayName
        let message = ["sender_id": senderId, "name": name, "text": text, "channel": channelParam]
        
        ref.setValue(message)
        
        finishSendingMessage()
    }
}
