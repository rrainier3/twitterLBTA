//
//  HomeDataSourceController.swift				
//  twitterLBTA
//
//  Created by RayRainier on 1/15/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
//        let homeDataSource = HomeDatasource()
//        self.datasource = homeDataSource

//		fetchHomeFeed() invoke with completion block!

		// Tracing sequence
        print(1)
        
        
		Service.sharedInstance.fetchHomeFeed { (homeDatasource) in
        
        	// Tracing sequence
            print(3)
            
            self.datasource = homeDatasource
        }
        
    }
    
        
    // collapse line spacing to remove gap
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // setup for sizeForItemAt
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    	if let user = self.datasource?.item(indexPath) as? User {
        
            // lets get an estimation of the height of our cell based on user.bioText
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 46)
        }
    
        return CGSize(width: view.frame.width, height: 200)
    }
    
    // setup Header Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
    	if section == 1 {
        
            	return .zero		// disables this section from section [0,1]
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // setup Footer Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    
        if section == 1 {
            
            return .zero		// disables this section from section [0,1]
        }
        
        return CGSize(width: view.frame.width, height: 64)
    }
}
