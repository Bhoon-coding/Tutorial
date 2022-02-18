//
//  NotificationViewController.swift
//  Tutorial
//
//  Created by BH on 2022/02/15.
//

import UIKit
import UserNotifications

import SnapKit
import SwiftUI

class NotificationViewController: UIViewController {
    
    // MARK: UI Property
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("테스트", for: .normal)
        button.addTarget(self, action: #selector(sendNotification), for: .touchUpInside)
        return button
    }()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        setUpUI()
        
//        notificationCenter.delegate = self
        // 사용자에게 푸시 권한 요청
        requestNotificationAuthorization()
    }
    
    func setUpUI() {
        // MARK: addSubView
        view.addSubview(testButton)
        
        // MARK: Layout
        testButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func requestNotificationAuthorization() {
        let authOptions: UNAuthorizationOptions = [.badge, .sound]
        
        notificationCenter.requestAuthorization(options: authOptions) { granted, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("didAllow ===> \(granted)")
            }
        }
    }
    
    @objc func sendNotification() {
        let content = UNMutableNotificationContent()

            content.title = "여긴 제목!! "
            content.body = "여기엔 알림 내용이 나온다아"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
            notificationCenter.add(request) { error in
                if let error = error {
                    print("Notification Error: ", error)
                }
            }
    }
    
}
