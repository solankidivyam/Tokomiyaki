//
//  AppDelegate.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 16/06/21.
//

import UIKit
import CoreData
import Parse



@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        let configuration = ParseClientConfiguration {
            $0.applicationId = "LeoqR3YmJHfNi0ntsT3XJSlUh9p670hUnGb33l9g"
            $0.clientKey = "58Gfb54eKfooSCAh9OYAk9ROEj3zZ6oMzxAdS7HG"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: LoginController())
        
        
        
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

