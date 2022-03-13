//
//  DetailViewController.swift
//  Tutorial
//
//  Created by BH on 2022/03/13.
//

import UIKit

import SnapKit

protocol SendDataDelegate {
    func sendData(data: String)
}

class DetailViewController: UIViewController {
    
    var delegate: SendDataDelegate?
    
    // MARK: UI Properties
    lazy var dataTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "내용을 입력해주세요."
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setUpUI()
        
    }
    
    func setUpUI() {
        // MARK: addSubView
        
        view.addSubview(dataTextField)
        view.addSubview(saveButton)
        
        // MARK: Layout
        
        dataTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(200)
            $0.width.equalTo(200)
            $0.height.equalTo(48)
        }
        
        saveButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(44)
        }
    }
    
    @objc func saveTapped() {
        if let data = dataTextField.text {
            delegate?.sendData(data: data)
        }
        dismiss(animated: true, completion: nil)
    }

}



// MARK: Preview

import SwiftUI

struct DetailViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct DetailViewPreview: PreviewProvider {
    static var previews: some View {
        DetailViewControllerRepresentable()
    }
}
