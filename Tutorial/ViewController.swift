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
    
    lazy var getButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.addTarget(self, action: #selector(getData), for: .touchUpInside)
        return button
    }()
    
    lazy var getDataTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.text = "데이터가 없습니다."
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        setUpUI()
        
    }
    
    private func setUpUI() {
        view.addSubview(getButton)
        view.addSubview(getDataTextView)
        
        getButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(80)
            $0.width.height.equalTo(200)
        }
        
        getDataTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(getButton.snp.bottom).offset(50)
            $0.width.height.equalTo(250)
        }
    }
    
    @objc func getData() {
        print("get버튼 터치")
        
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
