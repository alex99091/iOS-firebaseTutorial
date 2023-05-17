//
//  TodoCell.swift
//  firebaseTutorial
//
//  Created by BOONG KI KWAK on 2023/05/17.
//

import UIKit

class TodoCell: UITableViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

