//
//  ChannelViewController.swift
//  messenger-app
//
//  Created by M Jawad Khan on 26/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    

    @IBAction func b1(_ sender: UIButton) {
        if t1.text != nil {
            performSegue(withIdentifier: "segueChannel", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var chatViewController = segue.destination as! ChatViewController
        chatViewController.myString = t1.text!
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(t1.text)
        
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
