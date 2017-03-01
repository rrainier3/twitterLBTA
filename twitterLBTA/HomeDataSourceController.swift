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

	let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies, something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0 	// this causes text to wrap-around
        label.isHidden = true		// defaults to hidden = no Errors
        return label
    }()

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        // LBTA method call convenience func fillSuperview()
        errorMessageLabel.fillSuperview()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
		Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
        
        	if let err = err {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                    
                    	// Could be a 404 page not found!
                        // we can print the actual statusCode?
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                return
            }
            
            self.datasource = homeDatasource
        }
        
    }
    
    // collapse line spacing to remove gap
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // setup for sizeForItemAt
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

/*
     returning .zero means you revert the object to 0-width:0-height
*/
        
    	// first section of users
        if indexPath.section == 0 {
        
        	// our user.biotext size estimation
        
        	guard let user = self.datasource?.item(indexPath) as? User else {
                return .zero
            }
        
            let estimatedHeight = estimatedHeightForText(user.bioText)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
            
        } else if indexPath.section == 1 {
        
            // our tweets size estimation
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else {
                return .zero
            }
            
			let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    fileprivate func estimatedHeightForText(_ text: String) -> CGFloat {
        
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
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
