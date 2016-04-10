//
//  action.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/22.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import ReSwift

struct SplashImageInfoActionGet: StandardActionConvertible {
    
    static let type = "SPLASH_IMAGE_Info_ACTION_GET"
    var store:Store<AppState>?
    
    init(store:Store<AppState>?) {
        self.store = store
    }
    init(_ standardAction: StandardAction) {}
    
    func toStandardAction() -> StandardAction {
        return StandardAction(type: SplashImageInfoActionGet.type, payload: [:], isTypedAction: true)
    }
    
}

struct SetSplashImageInfo: Action {
    var splashImageInfo: SplashImageInfo
    var store:Store<AppState>?
}