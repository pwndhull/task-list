//
//  AppDelegate.swift
//  Task List
//
//  Created by Pawan Dhull on 16/05/20.
//  Copyright © 2020 Pawan Dhull. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
@available(iOS 13.0, *)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let taskStore = TaskStore()
//     let todoTask = [Task.init(Name: "Watch tutorials."),Task.init(Name: "Practice Swift."),Task.init(Name: "Have some chill moment."),Task.init(Name: "Eat and Sleep.")]
//     let doneTaks = [Task.init(Name: "Don't Give a Fuck.")]
//      taskStore.tasks = [todoTask,doneTaks]
        
//        let taskController = window?.rootViewController?.children.first as? TableViewController
//        taskController?.taskStore = taskStore
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

