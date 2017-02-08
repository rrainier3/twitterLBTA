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
    
        //print("Now ready to parse json: \n")
        
        var users = [User]()
        
        let array = json["users"].array
        
        for userJson in array! {
 
            let user = User(json: userJson)
            
            users.append(user)
        }
        
        var tweets = [Tweet]()
        
        let tweetJsonArray = json["tweets"].array
        for tweetJson in tweetJsonArray! {
        
            //print(tweetJson)
            
            let userJson = tweetJson["user"]
            
            let user = User(json: userJson)

            let message = tweetJson["message"].stringValue
            
            let tweet = Tweet(user: user, message: message)
            
            tweets.append(tweet)
        }
        
        self.users = users
        
        self.tweets = tweets
	}

/*
     replace the line
     for userJson in array! { ... } by checking first if the users array is not nil and unwrap it safely with a guard let
     guard let array = json["users"].array else { throw JSONError }
     for userJson in array { ... } // More safe. Never ever trust the JSON response you get from the internet, even though you're the person who write the web services :)﻿
     
*/
    
/*
    let users: [User] = {
        let ashleyUser = User(name: "Ashley Drake", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!  This is a great time to learn new programming languages that are best suited for web and internet development.", profileImage: #imageLiteral(resourceName: "ashley"))
        
        let janiceUser = User(name: "Janice Duncan", username: "@echonetwork", bioText: "Janice Duncan is a developer that tweets about iPhone and iOS programming techniques and development. She is an avid fan of the Chicago Cubs.", profileImage: #imageLiteral(resourceName: "janice"))
        
        let smithUser = User(name: "Kelly Smith", username: "@burlington", bioText: "Kelly Smith's recently released course on basic training provides some excellent guidance on how to use UITableView and UICollectionView.  This course also teaches some basics on the Swift language. This is an anthology of the wikipedia website explaining the evolution of the technological study of machine learning.", profileImage: #imageLiteral(resourceName: "smith"))
        
        return [ashleyUser, janiceUser, smithUser]
    }()

    var tweets: [Tweet] = {
       let ashleyUser = User(name: "Ashley Drake", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!  This is a great time to learn new programming languages that are best suited for web and internet development.", profileImage: #imageLiteral(resourceName: "ashley"))
       
       let tweet = Tweet(user: ashleyUser, message: "Welcome to this episode 9 of the Twitter Series.  I really hope you guys are enjoying the series so far.  I really really need a long text block to render out so we're going to stop right here.")
       
       let tweet2 = Tweet(user: ashleyUser, message: "This is tweet number 2 of the Twitter Series.  I really hope you guys are enjoying the series so far.  I really really need a long text block to render out so we're going to stop right here.")
       
       return [tweet, tweet2]
        
    }()
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
