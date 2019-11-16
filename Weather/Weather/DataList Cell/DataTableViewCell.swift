//
//  DataTableViewCell.swift
//  Weather
//
//  Created by logesh on 11/9/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit

//MARK: - Class
class DataTableViewCell: UITableViewCell {
    
    //MARK: - Outlets

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var tempeLabel: UILabel!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Functions
    func setTempData(cityName : String,cityTemperature : String)  {
       self.cityName.text = cityName
       self.tempeLabel.text = "\(cityTemperature)°C"
     
    }
    
}


