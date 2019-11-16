//
//  TableViewCell.swift
//  Weather
//
//  Created by logesh on 11/9/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit
import Foundation

//MARK: - Protocols
protocol TableviewCellDelegate  {
    func addCity()
}

//MARK: - Class
class TableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var delegate : TableviewCellDelegate?
    @IBAction func addCity(_ sender: Any) {
        self.delegate?.addCity()
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
