//
//  TempDetail1.swift
//  Weather
//
//  Created by logesh on 11/11/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit

class TempDetail1: UITableViewCell {

    @IBOutlet weak var cityDetail1: UILabel!
    @IBOutlet weak var cityTemp1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initcell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initcell()  {
        self.cityDetail1.font = cityDetail1.font.withSize(30.0)
        self.cityTemp1.font = cityTemp1.font.withSize(55.0)
    }
    
    
    
    func setTempdetailData(cityName : String,cityTemperature : String)  {
          self.cityDetail1.text = cityName
          self.cityTemp1.text = "\(cityTemperature)°C"
         
       }
    
}
