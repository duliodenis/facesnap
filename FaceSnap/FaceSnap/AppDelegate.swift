//
//  AppDelegate.swift
//  FaceSnap
//
//  Created by Dulio Denis on 12/17/16.
//  Copyright © 2016 ddApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // assign the window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // ensure that window is not nil - else return false
        guard let window = window else { return false }
        window.backgroundColor = UIColor.whiteColor()
        
        // instantiate a PhotoListController Object
        let photoListController = PhotoListController()
        
        // embed the photoListController into a navigation controller
        let navigationController = UINavigationController(rootViewController: photoListController)
        
        // assign the navigationController as the rootViewController of the window
        window.rootViewController = navigationController
        // make this the key windows and make it visible
        window.makeKeyAndVisible()
        
        return true
    }

}

