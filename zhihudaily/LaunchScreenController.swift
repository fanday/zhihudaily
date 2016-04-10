//
//  LaunchScreenController.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/14.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import UIKit
import ReSwift
import AlamofireImage
import Alamofire

var mainStore = Store(reducer:AppReducer(), state:AppState(splashImageInfo:nil))

class LauchScreenViewController: UIViewController,StoreSubscriber {
    @IBOutlet weak var splashImage: UIImageView!
    @IBOutlet weak var author: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        author.text = "hello"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        mainStore.subscribe(self)
        mainStore.dispatch(SplashImageInfoActionGet(store:mainStore))
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        print("new state>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        print("\(state.splashImageInfo?.splashImageUrl)")
        if let _ = state.splashImageInfo?.splashImageUrl{
            Alamofire.request(.GET, state.splashImageInfo!.splashImageUrl!)
                .responseImage { response in
                    debugPrint(response)
                    
                    print(response.request)
                    print(response.response)
                    debugPrint(response.result)
                    
                    if let image = response.result.value {
                        print("image downloaded: \(image)")
                        self.splashImage.image = image
                    }
            }
            
            
        }
        
        if let _ = state.splashImageInfo?.author{
            author.text = state.splashImageInfo?.author
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
