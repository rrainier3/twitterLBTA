//
//  Service.swift
//  twitterLBTA
//
//  Created by RayRainier on 2/7/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON


struct Service {

	let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    // our func needs a completion block ()->()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        // start our json fetch
        print("Fetch json feed from ../home")
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
/*
		Error tests: /twitter/home1 or /twitter/home_with_error
*/
        
        request.perform(withSuccess: { (homeDatasource) in
            
            // Success
            completion(homeDatasource, nil)
            print("Successfully fetched our json objects")
            
        }) { (err) in
            
            // Failed
            completion(nil, err)

        }        
        
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR!")
        }
    }
    
}
