//
//  Extension.swift
//  Tutorial
//
//  Created by BH on 2022/02/27.
//
//
import UIKit
//
//extension UIViewController {
//    func hideKeyboard() {
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
//                                                         action: #selector(UIViewController.dismissKeyboard)))
//    }
//    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}
extension UITextField {
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
