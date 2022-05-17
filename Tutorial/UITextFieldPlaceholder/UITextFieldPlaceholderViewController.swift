//
//  UITextFieldPlaceholderViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit

import SnapKit

class UITextFieldPlaceholderViewController: UIViewController {

    
    // MARK: Properties
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과 값"
        label.backgroundColor = .cyan
        return label
    }()
    
    lazy var textField: UITextField = {
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
//        button.addTarget(self, action: #selector(tappedConfirm), for: .touchUpInside)
//        return button
//    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        textField.delegate = self
        setUpUI()
        
    }
    
    // MARK: Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }

    
    // MARK: @objc
//    @objc func tappedConfirm() {
//
//        guard let text = textField.text else { return }
//        resultLabel = text
//
//    }
    
}

// MARK: extension - UI
extension UITextFieldPlaceholderViewController {
    private func setUpUI() {
        
        view.addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
        ])
        
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
//        view.addSubview(confirmButton)
//        NSLayoutConstraint.activate([
//            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            confirmButton.widthAnchor.constraint(equalToConstant: 80),
//            confirmButton.heightAnchor.constraint(equalToConstant: 40)
//
//        ])
        
    }
}
// MARK: extension - UITextFieldDelegate
extension UITextFieldPlaceholderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        let trimmedText = text.trimmingCharacters(in: .whitespaces)
        
        resultLabel.text = trimmedText
        textField.resignFirstResponder()
        return true
    }
}

// MARK: extension - UITextField
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

    func updateUIViewController(_ uiViewController: UITextFieldPlaceholderViewController,
                                context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct UITextFieldPlaceholderViewPreview: PreviewProvider {
    static var previews: some View {
        UITextFieldPlaceholderViewControllerRepresentable()
    }
}
