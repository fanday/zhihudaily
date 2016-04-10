//
//  reducer.swift
//  zhihudaily
//
//  Created by Yungui Dai on 16/3/22.
//  Copyright © 2016年 Yungui Dai. All rights reserved.
//

import ReSwift
import Alamofire
import SwiftyJSON

var API_COVER_URL = "https://news-at.zhihu.com/api/4/start-image/1080*1776"

struct AppReducer:Reducer {
    func handleAction(action: Action, state:AppState?)->AppState{
        return AppState(splashImageInfo:splashImageUrlReducer(action,splashImageInfo:state?.splashImageInfo))
    }
}

func splashImageUrlReducer(action:Action, splashImageInfo: SplashImageInfo?)->SplashImageInfo?{
    
    //FIXME: 
    //handle state init when ReswiftInit Action
    var currentSplashImageInfo:SplashImageInfo? = SplashImageInfo(splashImageUrl:String(),author: String())
    if let _ = splashImageInfo{
        currentSplashImageInfo!.splashImageUrl = splashImageInfo?.splashImageUrl ?? nil
        currentSplashImageInfo!.author = splashImageInfo?.author ?? nil
    
    }
    
    
    switch action{
    case let splashImageInfoActionGet as SplashImageInfoActionGet:
        print("make a request")
        Alamofire.request(.GET, API_COVER_URL)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let reJSON = response.result.value {
                    print("JSON: \(reJSON)")
                    let json = JSON(reJSON)
                    print(json)
                    currentSplashImageInfo!.splashImageUrl = json["img"].string
                    currentSplashImageInfo!.author = json["text"].string
                    print("url is \(currentSplashImageInfo!.splashImageUrl)")
                    print("author is:\(currentSplashImageInfo!.author)")
                    dispatch_async(dispatch_get_main_queue()) {
                        splashImageInfoActionGet.store!.dispatch(SetSplashImageInfo(splashImageInfo: currentSplashImageInfo!,store:splashImageInfoActionGet.store))
                    }
                }
        }
        print("a request is made")

    case let action as SetSplashImageInfo:
        return action.splashImageInfo
        
    default:
        break
    }
    
    return currentSplashImageInfo
    
}