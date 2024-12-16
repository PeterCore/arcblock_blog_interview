//
//  AppDelegate.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        // 将“自定义的视图控制器（ViewController()）”添加到“导航控制器UINavigationController”中
//              let nav = UINavigationController(rootViewController: ViewController())
//              // 新建窗口
//              self.window = UIWindow(frame: UIScreen.main.bounds)
//              // 设置窗口的背景色为白色
//              self.window?.backgroundColor = .white
//              // 设置窗口的“根视图控制器”为上面自定义的导航控制器nav
//              self.window?.rootViewController = nav
//              // 设置窗口到屏幕最前端
//              self.window?.makeKeyAndVisible()
       

        return true
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

