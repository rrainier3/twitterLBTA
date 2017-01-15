//
//  HomeDatasource.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/15/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    let words = ["User1", "User2", "User3"]
    
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
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
