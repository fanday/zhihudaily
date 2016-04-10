//
//  state.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/22.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import ReSwift

struct SplashImageInfo{
    var splashImageUrl:String?
    var author:String?
}


struct AppState:StateType {
    var splashImageInfo:SplashImageInfo?
}
