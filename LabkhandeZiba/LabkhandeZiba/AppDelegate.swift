//
//  AppDelegate.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/10/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import UIKit
import XCGLogger
import MMDrawerController

let log: XCGLogger = {
  let log = XCGLogger.default
  log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLevel: .debug)
  
  
  return log
}()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
  
  var window: UIWindow?
  var drawerController: MMDrawerController?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    
    // Drawer
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let centerViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    let rightViewController = mainStoryboard.instantiateViewController(withIdentifier: "RightSideViewController") as! RightSideViewController
    let rightNav = UINavigationController(rootViewController: rightViewController)
    let centerNav = UINavigationController(rootViewController: centerViewController)
    drawerController = MMDrawerController(center: centerNav, rightDrawerViewController: rightNav)
    
    drawerController?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.all
    drawerController!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.all;
//    drawerController!.showsShadow = true
//    drawerController!.setMaximumRightDrawerxrWidth(180, animated: true, completion: nil)
    
    window!.rootViewController = drawerController
    window!.makeKeyAndVisible()

    return true
  }
  
  
}
