//
//  LoginViewController.swift
//  SimpleTwitterClient
//
//  Created by Dan Tong on 9/11/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {
  
  @IBOutlet weak var hiImage: UIImageView!
  @IBOutlet weak var getStartedImage: UIImageView!
  
  @IBOutlet weak var userNameLabel: UITextField!
  @IBOutlet weak var passwordLabel: UITextField!
  
  @IBOutlet weak var inputFieldsView: UIView!
  
  var kbHeight: CGFloat!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardWillAppear:", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardWillDisappear:", name: UIKeyboardWillHideNotification, object: nil)
    self.animateImages(false)
    
  }
  override func viewWillAppear(animated: Bool) {
    self.animateImages(true)
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Keyboard Manage
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
  func keyboardWillAppear(notification: NSNotification) {
    if let userInfo = notification.userInfo {
      if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
        kbHeight = keyboardSize.height
        animateTextField(true)
      }
    }
  }
  func keyboardWillDisappear(notification: NSNotification){
    animateTextField(false)
    
  }
  
  func animateTextField(up: Bool) {
    let movement = (up ? -kbHeight : 0)
    animateImages(!up)
    UIView.animateWithDuration(1, animations: {
      self.inputFieldsView.transform = CGAffineTransformMakeTranslation(0, movement)
    })
  }
  // MARK: -Animate images
  func animateImages(isShow: Bool){
    if isShow {
      UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
        self.hiImage.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: { (finished) -> Void in
          UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.getStartedImage.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: { (finished) -> Void in
          })
      })
    } else {
      UIView.animateWithDuration(0.1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
        self.getStartedImage.transform = CGAffineTransformMakeTranslation(150, 0)
        }, completion: { (finished) -> Void in
      })
      UIView.animateWithDuration(0.1, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
        self.hiImage.transform = CGAffineTransformMakeTranslation(150, 0)
        }, completion: { (finished) -> Void in
      })
      
    }
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
