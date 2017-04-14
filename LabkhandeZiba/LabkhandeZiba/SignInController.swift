//
//  SignUpController.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/11/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

  @IBOutlet weak var mobileTextField: UITextField!

  let showMobileViewController = "mobileVC"
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.view.backgroundColor = UIColor.white
      navigationController?.navigationBar.barTintColor = UIColor.navBar
      self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "IRANSansMobile-Medium", size: 15)!, NSForegroundColorAttributeName : UIColor.white];
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
  }
  
  @IBAction func signUpTapped(_ sender: Any) {
    performSegue(withIdentifier: showMobileViewController, sender: self)
  }

}
