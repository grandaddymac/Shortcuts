//
//  AppDelegate.swift
//  Shortcut
//
//  Created by gdm on 1/6/19.
//  Copyright © 2019 gdm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var vcsArray = [UIViewController]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Instantiate all VCs for shortcut
        //NOT NEEDED FOR TABBARCONTROLLER BRANCH
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mountainVC = storyboard.instantiateViewController(withIdentifier: "mountainVC") as! MountainsVC
//        let spaceVC = storyboard.instantiateViewController(withIdentifier: "spaceVC") as! SpaceVC
//        let oceanVC = storyboard.instantiateViewController(withIdentifier: "oceanVC") as! OceanVC
//        vcsArray = [mountainVC, spaceVC, oceanVC]
        
        //Create dynamic shorcut item
        let oceanShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).ocean", localizedTitle: "Ocean", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(templateImageName: "OceanShort"), userInfo: nil)
        
        application.shortcutItems = [oceanShortcut]
        
        return true
    }
    
    enum ShortcutType: String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UITabBarController
//            navVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortcutType.space.rawValue:
//                navVC.popToViewController(vcsArray[1], animated: true)
                navVC.selectedIndex = 1
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                navVC.selectedIndex = 2
//                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
            default:
//                navVC.popToRootViewController(animated: true)
                navVC.selectedIndex = 0
                completionHandler(true)

            }
        }
        completionHandler(false)
    }

}

