//
//  TableViewCell.swift
//  haberler
//
//  Created by Ahmet Samsun on 31.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
   let manager = Webservice()

    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
