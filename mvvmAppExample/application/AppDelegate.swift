//
//  AppDelegate.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 01/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController()

        if let rootViewController = window?.rootViewController as? UINavigationController {
            let movieListController = ScreenFactory.makeMovieListController()
            rootViewController.setViewControllers([movieListController], animated: false)
        }
        self.window?.makeKeyAndVisible()
        return true
    }

}

