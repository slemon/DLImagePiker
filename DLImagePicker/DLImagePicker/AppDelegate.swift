//
//  AppDelegate.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/23.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let items = ImagesLibrary.init().getImageImageAssets()
        
        
        
        return true
    }
}

