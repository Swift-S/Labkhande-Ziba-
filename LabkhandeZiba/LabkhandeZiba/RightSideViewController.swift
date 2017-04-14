//
//  RightSideViewController.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/11/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import UIKit

class RightSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  let mainPageIdentifire = "showMainPageVC"
  var menuItem: [String] = ["صفحه اصلی","عضویت"]
  var menuIcon = ["mainPage","signUp"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    navigationController?.navigationBar.barTintColor = UIColor.navBar
//    self.automaticallyAdjustsScrollViewInsets = false
    tableView.contentInset = UIEdgeInsetsMake(-100, 0, 0, 0)

  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItem.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RightSideMenuCell
    cell.menuItemCell.text = menuItem[indexPath.row]
    let imageName = UIImage(named: menuIcon[indexPath.row])
    cell.MenuItemIcon.image = imageName
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch (indexPath.row) {
    case 0:
      
      let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
      let centerNavController = UINavigationController(rootViewController: centerViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = centerNavController
      appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)
      
    case 1:
      
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInController") as! SignInController
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)
      
      
      
    default:
      print("ha?!")
    }
  }
  
}




//    switch someCharacter {
//    case 0:
//
//      let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//      let centerNavController = UINavigationController(rootViewController: centerViewController)
//      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//      appDelegate.drawerController?.centerViewController = centerNavController
//      appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)
//
//    case 1:
//
//      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
//      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
//      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//      appDelegate.drawerController?.centerViewController = SignUpNavController
//      appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)
//
//
//
//    default:
//      print("ha?!")
//    }
  
