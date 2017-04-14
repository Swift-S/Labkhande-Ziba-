//
//  SetupMainPageControll.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/12/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import Foundation

import UIKit

protocol ScrollImageViewDelegate {
  func scrollImageViewDidClicked(_ scrollImageView: SetupMainPageControll)
}

class SetupMainPageControll: UIView, UIScrollViewDelegate {
  
  var scrollView: UIScrollView!
  var pageControl: UIPageControl!
  var images = [UIImage]()
  var pageColor: UIColor! = nil
  var currentPageColor: UIColor! = nil
  var delegate: ScrollImageViewDelegate!
  var timer:Timer! = nil
  
  init(images: Array<UIImage>, frame: CGRect, pageColor: UIColor, currentPageColor: UIColor)
  {
    super.init(frame:frame)
    self.images = images
    self.pageColor = pageColor
    self.currentPageColor = currentPageColor
    createView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func createView() {
    self.scrollView = UIScrollView();
    self.scrollView.frame = self.frame
    self.scrollView.contentSize = CGSize(width: self.bounds.width * CGFloat(images.count + 2), height: 0)
    let imageViewfirst = UIImageView()
    imageViewfirst.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    imageViewfirst.image = images[images.count - 1]
    imageViewfirst.contentMode = .scaleAspectFill
    imageViewfirst.layer.masksToBounds = true
    self.scrollView.addSubview(imageViewfirst)
    
    for number in 0 ..< images.count {
      let imageView = UIImageView()
      imageView.frame = CGRect(x: CGFloat(number + 1) * self.bounds.width, y: 0, width: self.bounds.width, height: self.bounds.height)
      if (images[0] as AnyObject).isKind(of: UIImage.classForCoder()) {
        imageView.contentMode = .scaleAspectFill
        imageView.image = images[number]
      } else {
        
        
      }
      
      imageView.layer.masksToBounds = true
      let tap = UITapGestureRecognizer(target: self, action: #selector(tapImage))
      imageView.addGestureRecognizer(tap)
      imageView.isUserInteractionEnabled = true
      self.scrollView.addSubview(imageView)
      self.scrollView.contentOffset = CGPoint(x: self.bounds.width, y: 0)
    }
    
    let imageViewLast = UIImageView()
    imageViewLast.frame = CGRect(x: CGFloat(images.count + 1) * self.bounds.width, y: 0, width: self.bounds.width, height: self.bounds.height)
    imageViewLast.image = images[0]
    imageViewLast.contentMode = .scaleAspectFill
    imageViewLast.layer.masksToBounds = true
    self.scrollView.addSubview(imageViewLast)
    
    self.scrollView.isPagingEnabled = true
    self.scrollView.showsHorizontalScrollIndicator = false
    self.scrollView.delegate = self
    self.scrollView.backgroundColor = UIColor.white
    self.addSubview(scrollView)
    
    self.pageControl = UIPageControl()
    self.pageControl.numberOfPages = images.count
    self.pageControl.pageIndicatorTintColor = UIColor.white
    self.pageControl.currentPageIndicatorTintColor = UIColor.navBar
    self.pageControl.frame = CGRect(x: 0, y: self.bounds.height - 10, width: self.bounds.width, height: 30)
    self.addSubview(pageControl)
    
    timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
  }
  
  func autoScroll(){
    let page:Int = pageControl.currentPage
    var nextpage:Int
    
    if page == self.images.count - 1 {
      nextpage = 0
    } else {
      nextpage = page + 1
    }
    
    pageControl.currentPage = nextpage
    
    if nextpage == 0 {
      nextpage = images.count
    }
    
    let point = CGPoint(x: self.bounds.size.width * CGFloat(nextpage + 1), y: 0)
    self.scrollView.setContentOffset(point, animated: true)
  }
  
  func tapImage() {
    
  }
  
  //    override func draw(_ rect: CGRect) {
  //        self.backgroundColor = UIColor.red
  //    }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset == CGPoint(x: CGFloat(images.count + 1) * self.bounds.width, y: 0) {
      self.scrollView.contentOffset = CGPoint(x: self.bounds.width, y: 0)
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    var page = Int(scrollView.contentOffset.x / self.bounds.width) - 1
    
    if page == -1 {
      page = images.count - 1
      self.scrollView.contentOffset = CGPoint(x: self.bounds.width * CGFloat(images.count), y: 0)
    } else if page == images.count  {
      page = 0
      self.scrollView.contentOffset = CGPoint(x: self.bounds.width, y: 0)
    }
    
    self.pageControl.currentPage = page
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    timer.invalidate()
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
  }
}
