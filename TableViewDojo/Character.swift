//
//  Character.swift
//  TableViewDojo
//
//  Created by Matheus Gustavo dos Santos Vechietin on 06/09/17.
//  Copyright © 2017 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import Foundation

class Character: NSObject {
    var name: String
    var pictureURL: String
    
    init(item: NSDictionary) {
        self.name = item["name"] as! String;
        
        let thumbnailDic = item["thumbnail"] as! NSDictionary;
        self.pictureURL = (thumbnailDic["path"] as! String) + "." + (thumbnailDic["extension"] as! String);
    }
}
