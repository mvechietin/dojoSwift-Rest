//
//  Webservice.swift
//  TableViewDojo
//
//  Created by Matheus Gustavo dos Santos Vechietin on 06/09/17.
//  Copyright © 2017 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Webservice: NSObject {
    
    
    func getCharacters(viewController: ViewController) -> Void {
        Alamofire.request(URL(string:"https://gateway.marvel.com/v1/public/characters?ts=1504638612&apikey=db2fc95c3b2f347d72395920c78f37cc&hash=14e5f0f37d845c526cfb5a97f3580ded")!, method: .get).validate().responseJSON { response in
            guard response.result.isSuccess else {
                print("Error")
                return
            }
            if let responseJSON = response.result.value {
                let json = responseJSON as! NSDictionary;
                let data = json["data"] as! NSDictionary;
                let characters = data["results"] as! NSArray;
                viewController.repoList = characters.mutableCopy() as! NSMutableArray;
                viewController.loadList();
            } else {
                print("ERROR")
                return
            }
        }
    }
}


