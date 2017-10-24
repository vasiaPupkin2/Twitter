//
//  Service.swift
//  Twitter
//
//  Created by leanid niadzelin on 27.02.17.
//  Copyright © 2017 Leanid Niadzelin. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "http://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            
            completion(homeDatasource, nil)
            
        }) { (error) in
            
            completion(nil, error)
        }
    }
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
}
