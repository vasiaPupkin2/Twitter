//
//  HomeDataSource.swift
//  Twitter
//
//  Created by leanid niadzelin on 22.02.17.
//  Copyright © 2017 Leanid Niadzelin. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    
    let tweets: [Tweet]
    let users: [User]
    
    required init(json: JSON) throws {
        
        
        guard let userJsonArray = json["users"].array else {
            throw NSError(domain: "com.lets", code: 1, userInfo: [NSLocalizedDescriptionKey: "'users' not valid in JSON."])
        }
        guard let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.lets", code: 1, userInfo: [NSLocalizedDescriptionKey: "'tweet' not valid in JSON."])
        }
        
        
//        self.users = userJsonArray.map({User(json: $0)})
//        self.tweets = tweetJsonArray.map({Tweet(json: $0)})
        self.users = try userJsonArray.decode()
        self.tweets = try tweetJsonArray.decode()
        
    }
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TwitterCell.self]
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
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 0 {
            return users[indexPath.item]
        }
        return tweets[indexPath.item]
    }
}
