//
//  action.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/22.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import ReSwift

struct SplashImageUrlActionGet: StandardActionConvertible {
    
    static let type = "SPLASH_IMAGE_URL_ACTION_GET"
    
    init() {}
    init(_ standardAction: StandardAction) {}
    
    func toStandardAction() -> StandardAction {
        return StandardAction(type: SplashImageUrlActionGet.type, payload: [:], isTypedAction: true)
    }
    
}

struct SetSplashImageUrl: Action {
    let splashImageUrl: String
}