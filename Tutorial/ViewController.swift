//
//  ViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit

import Alamofire
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: UI Property
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("테스트", for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    lazy var testTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "여기다 글을 써주세요"
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        tf.leftPadding()
        tf.returnKeyType = .done
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        testTextField.delegate = self
        setUpUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keybaordRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keybaordRectangle.height
        view.frame.origin.y -= keyboardHeight
      }
    }
      
    @objc private func keyboardWillHide(_ notification: Notification) {
//      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//        let keybaordRectangle = keyboardFrame.cgRectValue
//      }
        view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func setUpUI() {
        // MARK: addSubView
        view.addSubview(testButton)
        view.addSubview(testTextField)
        
        // MARK: Layout
        testButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(150)
        }
        testTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(200)
            $0.height.equalTo(44)
        }
    }
    
    @objc func tappedButton() {
        print("Test")
    }

}



// MARK: Preview

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
