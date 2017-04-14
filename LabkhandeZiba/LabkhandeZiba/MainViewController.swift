//
//  ViewController.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/10/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import UIKit
import SCLAlertView
import ALCameraViewController


class MainViewController: UIViewController {
  
  let navTitleFont = "IRANSansMobile-Medium"
  
  @IBOutlet weak var headerImgView: UIImageView!
  
  @IBOutlet weak var news: UIButton!
  @IBOutlet weak var smilingSuperiorJournalistButton: UIButton!
  @IBOutlet weak var smileViableButton: UIButton!
  @IBOutlet weak var latestPostsButton: UIButton!
  @IBOutlet weak var topPerformancesInTermsOfPeopleSmilingButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // I'm Here...
    
    self.setupView()
    self.setupBttn()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)
  }
  
  func setupView(){
    self.navigationController?.navigationBar.barTintColor = UIColor.navBar
    self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: navTitleFont, size: 15)!, NSForegroundColorAttributeName : UIColor.white];
    let images: Array<UIImage> = [
      UIImage(named: "01.jpg")!, UIImage(named: "02.jpg")!, UIImage(named: "03.jpg")!]
    let imageView = SetupMainPageControll(images: images, frame: self.headerImgView.frame, pageColor: UIColor.lightGray, currentPageColor: UIColor.orange)
    self.view.addSubview(imageView)
  }
 
  func setupBttn(){
    self.news.applyCardStyle()
    self.smilingSuperiorJournalistButton.applyCardStyle()
    self.smileViableButton.applyCardStyle()
    self.latestPostsButton.applyCardStyle()
    self.topPerformancesInTermsOfPeopleSmilingButton.applyCardStyle()
  }
}

extension UIView {
  
  @discardableResult
  func applyCardStyle() -> UIView {
    let layer = self.layer
    layer.masksToBounds = false
    layer.cornerRadius = 10
    layer.shadowOpacity = 5
    layer.shadowRadius = 2.0
    layer.shadowOffset = CGSize.zero
    layer.shadowColor = UIColor.black.cgColor
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    
    return self
  }
}



