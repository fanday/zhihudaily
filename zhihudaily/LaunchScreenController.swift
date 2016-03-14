//
//  LaunchScreenController.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/14.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import UIKit

import UIKit

class LauchScreenViewController: UIViewController {
    @IBOutlet weak var splashImage: UIImageView!
    @IBOutlet weak var author: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        author.text = "hello"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
