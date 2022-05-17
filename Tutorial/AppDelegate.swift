//
//  AppDelegate.swift
//  Tutorial
//
//  Created by BH on 2022/02/10.
//

import UIKit

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            print(
                  """
                  --------------------------------------------------
                  didFinishLaunchingWithOptions:
                  - 앱이 실행된 직후 사용자의 화면에 보여지기 직전에 호출
                  --------------------------------------------------
                  """
            )
            return true
        }
        
        func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            print(
                  """
                  --------------------------------------------------
                  willFinishLaunchingWithOptions:
                  - 앱이 최초 실행될 때 호출
                  --------------------------------------------------
                  """
            )
            return true
        }
        
        func applicationWillResignActive(_ application: UIApplication) {
            print(
                  """
                  --------------------------------------------------
                  === iOS 13이후 scene: willResignActive로 바뀜 ===
                  [AppDelegate]
                  applicationWillResignActive:
                  - inactive 상태로 되기전에 호출
                  --------------------------------------------------
                  """
            )
        }
        
        func applicationDidEnterBackground(_ application: UIApplication) {
            print(
                  """
                  --------------------------------------------------
                  === iOS 13이후 scene: didEnterBackground로 바뀜 ===
                  [AppDelegate]
                  applicationDidEnterBackground:
                  - 앱이 백그라운드로 전환된 후 호출
                  --------------------------------------------------
                  """
            )
        }
        
        func applicationWillEnterForeground(_ application: UIApplication) {
            print(
                  """
                  --------------------------------------------------
                  [AppDelegate]
                  === iOS 13이후 scene: willEnterForeground로 바뀜 ===
                  applicationWillEnterForeground:
                  - 앱이 Foreground로 진입하기 전에 호출
                  - active 상태가 되기전 호출
                  --------------------------------------------------
                  """
            )
        }
        
        func applicationDidBecomeActive(_ application: UIApplication) {
            print(
                  """
                  --------------------------------------------------
                  [AppDelegate]
                  === iOS 13이후 scene: didBecomeActive로 바뀜 ===
                  applicationDidBecomeActive:
                  - active 상태가 된 후 호출
                  --------------------------------------------------
                  """
            )
        }
        
        func applicationWillTerminate(_ application: UIApplication) {
            print(
                  """
                  --------------------------------------------------
                  [AppDelegate]
                  applicationWillTerminate:
                  - 앱이 종료되기 직전에 호출
                  --------------------------------------------------
                  """
            )
        }

        // MARK: UISceneSession Lifecycle
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            // Called when a new scene session is being created.
            // Use this method to select a configuration to create the new scene with.
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        }

        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
            // Called when the user discards a scene session.
            // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
            // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        }


    }


//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        UNUserNotificationCenter.current().delegate = self
//        return true
//    }
//
//    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        return true
//    }
//
//    func applicationWillResignActive(_ application: UIApplication) {
//
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }




extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // 앱이 foreground 상태에 있을때도 알림을 받게 해줌.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .list, .badge, .sound])
        } else {
            completionHandler([.badge, .sound, .alert])
        }
    }
}

