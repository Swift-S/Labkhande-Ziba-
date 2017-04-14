//
//  MobileViewController.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/11/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import UIKit

class MobileViewController: UIViewController {

  @IBOutlet weak var mobileTextField: UITextField!
  
  let showUserDataIdentifire = "showUserDataVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)
  }

  @IBAction func nextTapped(_ sender: Any) {
    performSegue(withIdentifier: showUserDataIdentifire, sender: self)

  }

}
