//
//  Tweet.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
