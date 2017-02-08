//
//  Tweet.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
