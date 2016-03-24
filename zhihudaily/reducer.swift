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
        return AppState(splashImageUrl:splashImageUrlReducer(action,splashImageUrl:state?.splashImageUrl))
    }
}

func splashImageUrlReducer(action:Action, splashImageUrl: String?)->String?{
    var splashImageUrl = splashImageUrl ?? nil
    switch action{
    case _ as SplashImageUrlActionGet:
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
                    splashImageUrl = json["img"].string
                    print("url is \(splashImageUrl)")
                    dispatch_async(dispatch_get_main_queue()) {
                        mainStore.dispatch(SetSplashImageUrl(splashImageUrl: splashImageUrl!))
                    }
                }
        }
        print("a request is made")

    case let action as SetSplashImageUrl:
        return action.splashImageUrl
        
    default:
        break
    }
    
    return splashImageUrl
    
}