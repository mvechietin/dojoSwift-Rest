//
//  CustomCell.swift
//  TableViewDojo
//
//  Created by Matheus Gustavo dos Santos Vechietin on 05/09/17.
//  Copyright © 2017 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterPhoto: UIImageView!
    
    func setupCell(character: Character) -> Void {
        self.characterName.text = character.name;
        self.characterPhoto.loadImageUsingCache(withUrl: character.pictureURL);
    }
}
