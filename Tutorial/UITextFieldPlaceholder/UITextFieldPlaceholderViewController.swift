//
//  UITextFieldPlaceholderViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit
import SnapKit

class UITextFieldPlaceholderViewController: UIViewController, UITextFieldDelegate {

    lazy var testTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "여기다 글을 써주세요"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.leftPadding()
        return textField
    }()
    
//    lazy var confirmButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("확인", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 10
//        button.layer.borderWidth = 1
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        testTextField.delegate = self
        setUpUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        hideKeyboard()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        testTextField.resignFirstResponder()
        return true
    }

    private func setUpUI() {
        
        view.addSubview(testTextField)
//        view.addSubview(confirmButton)
        
        testTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        testTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        testTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
//        confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
//        confirmButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
        
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    
}



