//
//  AppDelegate.swift
//  iOSDemoApp
//
//  Created by Alejandro Castillo on 10/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { 
        setupMainFlowApp()
        return true
    }
}

extension AppDelegate {
    private func setupMainFlowApp() {
        let InitialVC = UINavigationController(rootViewController: InitialViewController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = InitialVC
        window?.makeKeyAndVisible()
    }
}
