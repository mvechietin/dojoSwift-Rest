//
//  ViewController.swift
//  TableViewDojo
//
//  Created by Matheus Gustavo dos Santos Vechietin on 04/09/17.
//  Copyright © 2017 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var repoList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Lista";
        loadRequest();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupDelegateAndDataSource() -> Void {
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repoList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        var item:NSDictionary = self.repoList.object(at: indexPath.row) as! NSDictionary;
//        cell.textLabel?.text = item[""];
        return cell;
    }
    
    //request //https://api.github.com/search/users?q=ios
    func loadRequest() -> Void {
        Alamofire.request(URL(string:"http://192.168.1.102:3412")!, method: .get).validate().responseJSON { response in
            guard response.result.isSuccess else {
                print("Error")
                return
            }
            if let responseJSON = response.result.value {
                let json = responseJSON as! NSDictionary;
                let itemsArray = json["items"] as! NSArray;
                self.repoList.addObjects(from:itemsArray as! [NSDictionary]);
                self.setupDelegateAndDataSource();
            } else {
                print("ERROR")
                return
            }
        }
    }
}

