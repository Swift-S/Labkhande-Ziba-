//
//  ViewController.swift
//  ISRadioButton
//
//  Created by Ishaq Shafiq on 10/12/2015.
//  Copyright © 2015 TheGoal. All rights reserved.
//

import UIKit
import SCLAlertView
import ALCameraViewController
import fun

class UserDataViewController: UIViewController {
  
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nationalCodeTextField: UITextField!
  @IBOutlet weak var medicalSystemCodeTxtFld: UITextField!
  
  @IBOutlet weak var priceBttn: UIButton!
  
  @IBOutlet weak var medicalSystmLabel: UILabel!
  @IBOutlet weak var ageCategoryLabel: UILabel!
  @IBOutlet weak var priceWorkLabel: UILabel!
  @IBOutlet weak var dicountLabel: UILabel!
  @IBOutlet weak var dailyWorkLabel: UILabel!
  
  let kSuccessTitle = "💉"
  let kSubtitle = "لطفا یکی از موارد زیر را انتخاب کنید."
  
  let kDefaultAnimationDuration = 2.0
  
  
  var croppingEnabled: Bool = false
  var libraryEnabled: Bool = true
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imgView.layer.cornerRadius = imgView.frame.size.width/2
    imgView.clipsToBounds = true
  }
  
  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.right, animated: true, completion: nil)

  }
  
  @IBAction func cameraBttnTapped(_ sender: Any) {
    let cameraViewController = CameraViewController(croppingEnabled: croppingEnabled, allowsLibraryAccess: libraryEnabled) { [weak self] image, asset in
      self?.imgView.image = image
      self?.dismiss(animated: true, completion: nil)
    }
    present(cameraViewController, animated: true, completion: nil)
  }
  
  @IBAction func photoLibraryBttnTapped(_ sender: Any) {
    let libraryViewController = CameraViewController.imagePickerViewController(croppingEnabled: croppingEnabled) { [weak self] image, asset in
      self?.imgView.image = image
      self?.dismiss(animated: true, completion: nil)
    }
    present(libraryViewController, animated: true, completion: nil)
  }
  
  
  
  @IBAction func medicalSystemQuestionBttn(_ sender: Any) {
    let alert = SCLAlertView()
    _ = alert.addButton("متخصص") {
      print("متخصص")
      self.medicalSystmLabel.text = "متخصص"
    }
    _ = alert.addButton("دندانپزشک عمومی") {
      print("دندانپزشک عمومی")
      self.medicalSystmLabel.text = "دندانپزشک عمومی"
    }
    _ = alert.addButton("دانشجو") {
      print("دانشجو")
      self.medicalSystmLabel.text = "دانشجو"
    }
    _ = alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
  }
  
  @IBAction func ageCategoryQuestionBttn(_ sender: Any) {
    let alert = SCLAlertView()
    _ = alert.addButton("کودک") {
      print("کودک")
      self.ageCategoryLabel.text = "کودک"
    }
    _ = alert.addButton("بزرگسال") {
      print("بزرگسال")
      self.ageCategoryLabel.text = "بزرگسال"

    }
    _ = alert.addButton("سالمند") {
      print("سالمند")
      self.ageCategoryLabel.text = "سالمند"

    }
    _ = alert.addButton("تمام سنین") {
      print("تمام سنین")
      self.ageCategoryLabel.text = "تمام سنین"

    }
    _ = alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
    
  }
  
  @IBAction func priceForWorkQuestionBttn(_ sender: Any) {
    let alert = SCLAlertView()
    _ = alert.addButton("رایگان") {
      print("رایگان")
      self.priceWorkLabel.text = "رایگان"
    }

    _ = alert.addButton("بر اساس تعرفه های مصوب") {
      print("بر اساس تعرفه های مصوب")
      self.priceWorkLabel.text = "بر اساس تعرفه های مصوب"
    }
    _ = alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
    
  }
  
  @IBAction func discountRateQuestionBttn(_ sender: Any) {
    let alert = SCLAlertView()
    _ = alert.addButton("۰") {
      print("۰")
      self.dicountLabel.text = "۰٪"
    }
    _ = alert.addButton("۵") {
      print("۵")
      self.dicountLabel.text = "۵٪"

    }
    _ = alert.addButton("۱۰") {
      print("۱۰")
      self.dicountLabel.text = "۱۰٪"

    }
    _ = alert.addButton("۲۰") {
      print("۲۰")
      self.dicountLabel.text = "۲۰٪"

    }
    _ = alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
    
  }
  
  @IBAction func dailyWorkQuestionBttn(_ sender: Any) {
    let alert = SCLAlertView()
    _ = alert.addButton("تعطیل") {
      print("تعطیل")
      self.dailyWorkLabel.text = "تعطیل"
    }
    _ = alert.addButton("غیر تعطیل") {
      print("غیر تعطیل")
      self.dailyWorkLabel.text = "غیر تعطیل"

    }
    _ = alert.addButton("هردو") {
      print("تعطیل و غیر تعطیل")
      self.dailyWorkLabel.text = "هردو(تعطیل و غیر تعطیل)"
    }
    _ = alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
  }

  
  @IBAction func nextBttnTapped(_ sender: Any) {
    
  }
  
}










//
//
//let alert = SCLAlertView()
//_ = alert.addButton("", target:self, selector:#selector(UserDataViewController.firstButton))
//_ = alert.addButton("", target:self, selector:#selector(UserDataViewController.firstButton))
//_ = alert.addButton("", target:self, selector:#selector(UserDataViewController.testeTwo))
//
//_ = alert.addButton("") {
//  print("Second button tapped")
//}
//_ = alert.showSuccess(kSuccessTitle, subTitle: kSubtitle)
//
//
