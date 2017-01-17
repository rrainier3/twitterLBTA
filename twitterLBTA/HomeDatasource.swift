//
//  HomeDatasource.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/15/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {

    let users: [User] = {
        let ashleyUser = User(name: "Ashley Drake", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!  This is a great time to learn new programming languages that are best suited for web and internet development.", profileImage: #imageLiteral(resourceName: "ashley"))
        
        let janiceUser = User(name: "Janice Duncan", username: "@echonetwork", bioText: "Janice Duncan is a developer that tweets about iPhone and iOS programming techniques and development. She is an avid fan of the Chicago Cubs.", profileImage: #imageLiteral(resourceName: "janice"))
        
        return [ashleyUser, janiceUser]
    }()
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        //return words[indexPath.item]
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        //return words.count
        return users.count
    }
}
