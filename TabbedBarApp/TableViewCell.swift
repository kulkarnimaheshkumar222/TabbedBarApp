//
//  TableViewCell.swift
//  TabbedBarApp
//
//  Created by Mac on 06/09/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var scheduleNameLabel: UILabel!
    
    
    @IBOutlet weak var selectedRoomLabel: UILabel!
    
    @IBOutlet weak var selectedAppliancesLabel: UILabel!
    
    @IBOutlet weak var selectedTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
