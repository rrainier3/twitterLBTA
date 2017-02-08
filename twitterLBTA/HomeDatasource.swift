//
//  HomeDatasource.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/15/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {

    let users: [User]
    
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
    
		let usersJsonArray = json["users"].array
    	
        //for-loops replaced by array.map!
        
        self.users = usersJsonArray!.map{User(json: $0)}
        
        let tweetsJsonArray = json["tweets"].array
        
        self.tweets = tweetsJsonArray!.map{Tweet(json: $0)}
        
	}

/*
     replace the line
     for userJson in array! { ... } by checking first if the users array is not nil and unwrap it safely with a guard let
     guard let array = json["users"].array else { throw JSONError }
     for userJson in array { ... } // More safe. Never ever trust the JSON response you get from the internet, even though you're the person who write the web services :)﻿
     
*/
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        //return words[indexPath.item]
        if indexPath.section == 1 {
            return tweets[indexPath.item]	// return tweets if its the 2nd section!
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            
            return tweets.count
        }
        
        return users.count
    }
}
