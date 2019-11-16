//
//  TempDetail2.swift
//  Weather
//
//  Created by logesh on 11/11/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit

class TempDetail2: UITableViewCell {
    
    @IBOutlet weak var tempTitle1: UILabel!
    @IBOutlet weak var tempDetail1: UILabel!
    @IBOutlet weak var tempTitle2: UILabel!
    @IBOutlet weak var tempDetail2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setTempdetailData(title1 : String,title2 : String,data1 : Any ,data2 : Any)  {
             self.tempTitle1.text = title1
             self.tempTitle2.text = title2
             self.tempDetail1.text = "\(data1)"
             self.tempDetail2.text = "\(data2)"
            
          }
    
}
