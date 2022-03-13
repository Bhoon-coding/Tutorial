//
//  ViewController.swift
//  Tutorial
//
//  Created by BH on 2022/03/13.
//

import UIKit

import SnapKit

class MainViewController: UIViewController, SendDataDelegate {
    
    // MARK: UI Properties
    lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.text = "기본값"
        label.tintColor = .white
        return label
    }()
    
    lazy var showDetailVCButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to DetailVC", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUpUI()
        
    }
    
    func sendData(data: String) {
        dataLabel.text = data
    }
    
    func setUpUI() {
        // MARK: addSubView
        view.addSubview(dataLabel)
        view.addSubview(showDetailVCButton)
        
        // MARK: Layout
        dataLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(250)
        }
        
        showDetailVCButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(44)
        }
    }
    
    @objc func tappedButton() {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        present(detailVC, animated: true, completion: nil)
    }

}



// MARK: Preview

import SwiftUI

struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct MainViewPreview: PreviewProvider {
    static var previews: some View {
        MainViewControllerRepresentable()
    }
}
