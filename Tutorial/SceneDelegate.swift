//
//  SceneDelegate.swift
//  AlamofirePractice
//
//  Created by BH on 2021/10/29.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print(
                """
                -----------------------------------------------
                scene:
                - scene이 앱에 추가될 때 호출.
                -----------------------------------------------
                """
        )
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print(
                """
                -----------------------------------------------
                sceneDidDisconnect:
                - scene의 연결이 해제될 때 호출. (다시 연결 될 수도 있습니다.)
                - 필요 없는 자원을 돌려주는 역할
                - 디스크, 네트워크를 통해 쉽게 불러올 수 있거나 생성이 쉬운 데이터를 돌려줌
                - 사용자의 input과 같은 재생성이 어려운 데이터는 갖고 있게 작업해줘야 함.
                -----------------------------------------------
                """
        )
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print(
                """
                -----------------------------------------------
                sceneDidBecomeActive:
                - app switcher에서 해당 앱이 선택될 때,
                  (app switcher: 홈 버튼을 두번 누르거나, 아이폰 화면 하단 바 (홈 인디케이터)를 위로 올렸을때 보이는 화면)
                - scene이 setup되고 화면에 보여지면서 사용할 준비가 된 상태.
                - inactive -> active
                - inactive가 되면서 멈춘 task 재실행할 때도 사용.
                -----------------------------------------------
                """
        )
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print(
                """
                -----------------------------------------------
                sceneWillResignActive:
                - active -> inactive
                - 다른화면으로의 전환
                - ex) 앱 사용중 전화가 올때
                -----------------------------------------------
                """
        )
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print(
                """
                -----------------------------------------------
                sceneWillEnterForeground:
                1. background -> foreground
                2. 앱이 실행 되고 active 상태가 될 때
                -----------------------------------------------
                """
        )
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print(
                """
                -----------------------------------------------
                sceneDidEnterBackground:
                1. foreground -> background 전환될 때
                2. 데이터를 저장, state 정보 저장, 공유된 리소스 돌려주는 작업할 때
                -----------------------------------------------
                """
        )
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

