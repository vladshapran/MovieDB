//
//  AppDelegate.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarVC  = UITabBarController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstVC")
        firstVC.tabBarItem = UITabBarItem(title: "List", image: nil, tag: 0)
        let secondVC = SecondChildViewController()
        let navVc = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem = UITabBarItem(title: "Favourites", image: nil, tag: 1)
        tabBarVC.viewControllers = [firstVC, navVc]
        tabBarVC.selectedViewController = firstVC
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        return true
    }

    


}

