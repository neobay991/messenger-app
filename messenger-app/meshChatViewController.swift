//
//  meshChatViewController.swift
//  messenger-app
//
//  Created by Yvonne Tang  on 28/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import Foundation
import BFTransmitter
import UIKit

class MeshViewController: UIViewController, BFTransmitterDelegate {
    
    fileprivate var transmitter: BFTransmitter = BFTransmitter(apiKey: "Key")
    var user: String = ""
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.transmitter = BFTransmitter(apiKey: "6885c648-f117-4630-92f2-a20d8b1be967")
        self.transmitter.delegate = self
    }
    
    @IBAction func startTransmitter() {
        self.transmitter.stop()
        self.transmitter.start()
    }
    
    @IBOutlet weak var messageText: UITextField!
    
    @IBAction func sendMessage() {
        let payload = ["text" : messageText.text!]
        let user = self.user
        let options: BFSendingOption = [.directTransmission]
        do {
            try transmitter.send(payload,
                                 with: nil,
                                 toUser: user,
                                 options: options)
        }
        catch let err as NSError
        {
            print("Error: \(err)")
        }
    }
    
    func transmitter(_ transmitter: BFTransmitter, didSendDirectPacket packetID: String) {
        let alert = UIAlertController(title: "Success", message: "Message sent", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        messageText.text?.removeAll()
    }
    
    func transmitter(_ transmitter: BFTransmitter, didFailForPacket packetID: String, error: Error?) {
        let alertMessage = "Success!"
        let alert = UIAlertController(title: "Mesh Network Connected to user \(user)", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func transmitter(_ transmitter: BFTransmitter, didReceive dictionary: [String : Any]?, with data: Data?, fromUser user: String, packetID: String, broadcast: Bool, mesh: Bool) {
        let alert = UIAlertController(title: "Incoming message", message: "\(dictionary!["text"]!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func transmitter(_ transmitter: BFTransmitter, didDetectConnectionWithUser user: String) {
        let alertMessage = "Connected to user \(user)"
        let alert = UIAlertController(title: "Connection Established", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        self.user = user
    }
    
    func transmitter(_ transmitter: BFTransmitter, didDetectDisconnectionWithUser user: String) {
        let alertMessage = "No longer connection to user \(user)"
        let alert = UIAlertController(title: "Connection Lost", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func transmitter(_ transmitter: BFTransmitter, didFailAtStartWithError error: Error) {
        let alertMessage = "Unable to establish connection"
        let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.transmitter.stop()
    }
}
