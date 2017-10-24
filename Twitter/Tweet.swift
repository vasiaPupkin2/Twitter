//
//  Tweet.swift
//  Twitter
//
//  Created by leanid niadzelin on 25.02.17.
//  Copyright © 2017 Leanid Niadzelin. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
        print(json)
    }
}
