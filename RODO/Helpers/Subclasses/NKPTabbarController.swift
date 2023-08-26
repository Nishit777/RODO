//
//  NKPTabbarController.swift
//  RODO
//
//  Created by NIshit Patel on 8/24/23.
//

import UIKit

final class NKPTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = UIColor.white
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .appDarkGreen
        
        if let tabBarItems = self.tabBar.items
        {
            for item in tabBarItems
            {
                item.title = nil
                item.image = item.image!.withBaselineOffset(fromBottom: 15.0)
            }
        }
    }
    
}
