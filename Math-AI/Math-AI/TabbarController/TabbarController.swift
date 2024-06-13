//
//  TabbarController.swift
//  Math-AI
//
//  Created by Fatih on 12.06.2024.
//

import Foundation
import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .main
        self.tabBar.barTintColor = .white
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.backgroundColor = .white
        setupTabs()
    }
    
    private func setupTabs() {
        let scan  = creatTabs(title: "Tarama & Çözüm", image: .scan, vc: CameraViewController())
        let subject  = creatTabs(title: "Konular", image: .subject, vc: TopicsViewController())
        let history   = creatTabs(title: "Geçmiş", image: .history, vc: CameraViewController())
        let settings   = creatTabs(title: "Ayarlar", image: .settings, vc: CameraViewController())
        self.setViewControllers([scan, subject, history, settings], animated: true)
        
    }
    
    private func creatTabs(title: String, image: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
        
    }
}
