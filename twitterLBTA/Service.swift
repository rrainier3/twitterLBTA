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
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        print("Fetching home food!")
        
        // start our json fetch
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            
            print("Successfully fetched our json objects")
            
            completion(homeDatasource)
            
        }) { (err) in
            
            print("Failed to fetch json ...", err)
        }        
        
        // Tracing asynch sequence
        //print(2)
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR!")
        }
    }
    
}
