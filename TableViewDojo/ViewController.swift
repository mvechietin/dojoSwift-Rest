//
//  ViewController.swift
//  TableViewDojo
//
//  Created by Matheus Gustavo dos Santos Vechietin on 04/09/17.
//  Copyright © 2017 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var repoList = NSMutableArray()
    var webservice = Webservice()
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista";
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.webservice.getCharacters(viewController: self);
    }
    
    // MARK: - Update List
    func loadList(){
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repoList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:NSDictionary = self.repoList[indexPath.row] as! NSDictionary;
        let character = Character(item: item);
        let customCell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "RepoCustomCell", for: indexPath) as! CustomCell;
        customCell.setupCell(character: character);
        return customCell;
    }
}

