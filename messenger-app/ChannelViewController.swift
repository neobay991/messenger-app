//
//  ChannelViewController.swift
//  messenger-app
//
//  Created by M Jawad Khan on 27/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

  
    @IBOutlet weak var channelButton1: UIButton!
    @IBOutlet weak var channelButton2: UIButton!
    @IBOutlet weak var channelButton3: UIButton!
    
    @IBAction func actionButtonChannel1(_ sender: UIButton) {
        if channelButton1.currentTitle != nil {
            performSegue(withIdentifier: "segueChannel", sender: self)
        }
    }
    
    @IBAction func actionButtonChannel2(_ sender: UIButton) {
        if channelButton2.currentTitle != nil {
            performSegue(withIdentifier: "segueChannel", sender: self)
        }
    }
    
    @IBAction func actionButtonChannel3(_ sender: UIButton) {
        if channelButton3.currentTitle != nil {
            performSegue(withIdentifier: "segueChannel", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var chatViewController = segue.destination as! ChatViewController
        if channelButton1.isTouchInside {
            chatViewController.channelParam = channelButton1.currentTitle!
            print("button 1 pressed")
        } else if channelButton2.isTouchInside {
            chatViewController.channelParam = channelButton2.currentTitle!
            print("button 2 pressed")
        } else if channelButton3.isTouchInside {
            chatViewController.channelParam = channelButton3.currentTitle!
            print("button 3 pressed")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
