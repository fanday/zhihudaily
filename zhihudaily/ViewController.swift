//
//  ViewController.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/9.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSideBar(sender: AnyObject) {
        print("show side bar")
        let sideBarController = SideBarController()
        sideBarController.showInViewController(self, animated: true)
        
    }

}

