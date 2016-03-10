//
//  TabBarController.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/9.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import UIKit

class TabBarContoller:UITabBarController,UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.hidden = true
        print("view did load")
    }
}
