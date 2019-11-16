//
//  TemperatureDetails.swift
//  Weather
//
//  Created by logesh on 11/10/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Class
class TemperatureDetails: UIViewController{
    
    
    
//MARK: - Outlets
   

    @IBOutlet weak var tempDetails: UITableView!
    var weatherData : [weatherModel] = []
    var dictionaryData : [Any] = []
     var dictionaryData2 : [Any] = []
    var titles1 : [String] = ["SUNRISE" , "WIND SPEED","MIN TEMPERATURE","DESCRIPTION","VISIBILITY"]
    var titles2 : [String] = ["SUNSET","WIND DEGREE","MAX TEMPERATURE","HUMIDITY","PRESSURE"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TemperatureDetails : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            tempDetails.register(UINib.init(nibName: "TempDetail1", bundle: nil), forCellReuseIdentifier: "TempDetail1Cell")
            let dataCell = tableView.dequeueReusableCell(withIdentifier: "TempDetail1Cell", for: indexPath) as! TempDetail1
            dataCell.setTempdetailData(cityName: weatherData[0].name, cityTemperature: "\(weatherData[0].main.temp)")
            return dataCell
            
        }
          tempDetails.register(UINib.init(nibName: "TempDetail2", bundle: nil), forCellReuseIdentifier: "TempDetail2Cell")
                  let dataCell = tableView.dequeueReusableCell(withIdentifier: "TempDetail2Cell", for: indexPath) as! TempDetail2
        dataCell.setTempdetailData(title1: titles1[(indexPath.row)-1], title2: titles2[(indexPath.row)-1], data1: dictionaryData[indexPath.row-1], data2: dictionaryData2[indexPath.row-1] )
                       return dataCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 215.0
        }
        return 59.0
    }
    
    
}
