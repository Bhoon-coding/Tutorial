//
//  UITextFieldPlaceholderViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setUpUI()
    }


    private func setUpUI() {
        view.addSubview(textField)
        
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}

extension UITextField {
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
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
