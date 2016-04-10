//
//  SideBarController.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/10.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import UIKit
public class SideBarController:UIViewController{
    private var width: CGFloat = 200.0
    private var tableView = UITableView()
    
    private func addToParentViewController(viewController: UIViewController, callingAppearanceMethods: Bool){
        if let _ = parentViewController{//判断是否有父view
            removeFromParentViewControllerCallingAppearanceMethods(callingAppearanceMethods)
        }
        if callingAppearanceMethods{
            beginAppearanceTransition(true, animated: false)
        }
        viewController.addChildViewController(self)
        viewController.view.addSubview(view)
        didMoveToParentViewController(self)
        if callingAppearanceMethods{
            endAppearanceTransition()
        }
    }
    
    private func removeFromParentViewControllerCallingAppearanceMethods(callAppearanceMethods: Bool){
        
        if callAppearanceMethods{
            beginAppearanceTransition(false, animated: false)
        }
        willMoveToParentViewController(nil)
        view.removeFromSuperview()
        removeFromParentViewController()
        if callAppearanceMethods{
            endAppearanceTransition()
        }
    }

    
    /**
     Shows the sidebar in a view controller.
     
     - Parameter viewController: The view controller in which to show the sidebar.
     - Parameter animated: If the sidebar should be animated.
     */
    public func showInViewController(viewController: UIViewController, animated: Bool){
       
        
        addToParentViewController(viewController, callingAppearanceMethods: true)
        view.frame = viewController.view.bounds
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.5
        
        let tableFrame = CGRect(x: 0, y: 0, width: width, height: view.frame.height)
        tableView.frame = tableFrame
        tableView.alpha = 1.0
        view.addSubview(tableView)
        
    }
    
    public override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.clearColor()
        
        let tapGesture:UITapGestureRecognizer! = UITapGestureRecognizer(target: self, action: #selector(SideBarController.handleTap(_:)))
        view.addGestureRecognizer(tapGesture!)
    }
    
    @objc private func handleTap(recognizer: UITapGestureRecognizer){
        dismissAnimated(true, completion: nil)
    }
    
    /**
     Dismisses the sidebar.
     
     - Parameter animated: If the sidebar should be animated.
     - Parameter completion: Completion handler called when the sidebar is dismissed.
     */
    public func dismissAnimated(animated: Bool, completion: ((Bool) -> Void)?){
        
        self.removeFromParentViewControllerCallingAppearanceMethods(true)
            
    }
    
}