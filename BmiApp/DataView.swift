// File Name: DataView.swift
// Author's Name: Vishal Patel
// Student ID: 301090662
// Date: 2019-12-14.

import UIKit

class DataView: UITableViewCell {

   
    @IBOutlet weak var lblBmi: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
