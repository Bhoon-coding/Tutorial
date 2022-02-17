//
//  ViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit

import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    // MARK: UI Property
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("테스트", for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUpUI()
        
    }
    
    func setUpUI() {
        // MARK: addSubView
        view.addSubview(testButton)
        
        // MARK: Layout
        testButton.snp.makeConstraints {
            $0.center.equalToSuperview()
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
