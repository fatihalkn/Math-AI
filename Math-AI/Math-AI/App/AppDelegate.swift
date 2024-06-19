//
//  AppDelegate.swift
//  Math-AI
//
//  Created by Fatih on 6.06.2024.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import ProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableDebugging = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 65.0
        IQKeyboardManager.shared.resignOnTouchOutside = true
        
        ProgressHUD.colorHUD = .white
        ProgressHUD.colorAnimation = .main
        ProgressHUD.colorBackground = .clear
        ProgressHUD.mediaSize = 40
        
        
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
    
    
    // Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        // "Model" ismi sizin .xcdatamodeld dosyanızın ismi ile aynı olmalıdır.
        let container = NSPersistentContainer(name: "FavoriteTopicsDataModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // Hata yönetimi
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
}

