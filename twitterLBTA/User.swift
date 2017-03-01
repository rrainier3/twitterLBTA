//
//  User.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/16/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
        
        self.profileImage = UIImage()
    }
}


