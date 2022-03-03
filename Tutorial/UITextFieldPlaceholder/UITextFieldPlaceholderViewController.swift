//
//  UITextFieldPlaceholderViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit
import SnapKit

class UITextFieldPlaceholderViewController: UIViewController {

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "여기다 글을 써주세요"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.leftPadding()
        return textField
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
        setUpUI()
//        hideKeyboard()
        
    }

    private func setUpUI() {
        
        view.addSubview(textField)
        view.addSubview(confirmButton)
        
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
//    @objc func keyboardWillShow(_ sender: Notification) {
//        view.frame.origin.y = -150
//    }
    
//    @objc func keyboardWillHide(_ sender: Notification) {
//        confirmButton.frame.origin.y = 0
//    }
}

extension UITextField {
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}


// MARK: Preview

import SwiftUI

struct UITextFieldPlaceholderViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UITextFieldPlaceholderViewController

    func makeUIViewController(context: Context) -> UITextFieldPlaceholderViewController {
        return UITextFieldPlaceholderViewController()
    }

    func updateUIViewController(_ uiViewController: UITextFieldPlaceholderViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct UITextFieldPlaceholderViewPreview: PreviewProvider {
    static var previews: some View {
        UITextFieldPlaceholderViewControllerRepresentable()
    }
}
