//
//  CustomTableViewCell.swift
//  Test
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610


import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {
 
    @IBOutlet weak var textItem: UITextField!

    @IBOutlet weak var quantity: UILabel!
    
    //increment quantity
    @IBAction func stepperChanged(_ sender: UIStepper) {
        quantity.text = Int(sender.value).description
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    //set the current cell as selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
