//
//  MarketTableViewCell.swift
//  PortfolioTrecker
//
//  Created by Nataliia Shusta on 07/02/2022.
//

import UIKit

class MarketTableViewCell: UITableViewCell {

    @IBOutlet weak var coinName: UILabel!
    
    @IBOutlet weak var coinPrice: UILabel!
    
    static let cellIdentifier = "marketTableVIewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
