//
//  TableViewCell.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class CarOwnerCell: UITableViewCell {
    @IBOutlet weak var car: UILabel!
    @IBOutlet weak var mileage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
