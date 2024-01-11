//
//  SecondViewController.swift
//  localization_demo
//
//  Created by Chandan Bhagabati on 11/01/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPreviousButtonClicked(_ sender: Any) {
        print("previous button pressed")
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
