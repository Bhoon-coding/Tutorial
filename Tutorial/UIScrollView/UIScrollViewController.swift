//
//  ScrollViewController.swift
//  Tutorial
//
//  Created by BH on 2022/03/03.
//

import UIKit
import SnapKit

class UIScrollViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var guideDimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.157, green: 0.196, blue: 0.235, alpha: 0.9)
        return view
    }()
    
    lazy var wayToTakePhotoView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var wayToTakePhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "스크롤 테스트"
        label.font = UIFont(name: "DMSans-Bold", size: 26)
        label.textColor = .white
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    lazy var titlesLabelWrapper: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "왼쪽 view"
        label.font = UIFont(name: "DMSans-Bold", size: 23)
        label.textColor = .white
        return label
    }()
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.text = "오른쪽 view"
        label.font = UIFont(name: "DMSans-Bold", size: 23)
        label.textColor = .white
        return label
    }()
    
    lazy var viewsWrapper: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [blueView, redView])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 5
        return stackView
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var redView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .red
        return view
    }()
    
//    lazy var blueView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        return view
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpGuideView()
        
    }
    
    private func setUpGuideView() {
        
        // MARK: layout
        
        view.addSubview(guideDimmedView)
        guideDimmedView.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
        
        guideDimmedView.addSubview(wayToTakePhotoView)
        wayToTakePhotoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(52)
        }
        
        wayToTakePhotoView.addSubview(wayToTakePhotoLabel)
        wayToTakePhotoLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        self.guideDimmedView.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(wayToTakePhotoView.snp.bottom)
            $0.bottom.equalToSuperview().inset(76)
            $0.width.equalTo(view.frame.width)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(view.frame.height)
        }
        
        contentView.addSubview(titlesLabelWrapper)
        titlesLabelWrapper.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(32)
            $0.leading.trailing.equalToSuperview().inset(84)
            $0.height.equalTo(30)
        }

        contentView.addSubview(viewsWrapper)
        viewsWrapper.snp.makeConstraints {
            $0.top.equalTo(titlesLabelWrapper.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(190)
        }
        
    }
    

}
