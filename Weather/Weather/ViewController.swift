//
//  ViewController.swift
//  Weather
//
//  Created by logesh on 11/8/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit

protocol sendData {
    func senData(data : weatherModel)
}



//MARK: - Class
class ViewController: UIViewController,TableviewCellDelegate{

    func addCity() {
    self.setSubView()
    }
    
    //MARK: - Outlets & Variables

    var weatherData : [weatherModel] = [ ]
    var delegate : sendData?
    
    @IBOutlet weak var tempListTableView: UITableView!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    //MARK: - Functions
    func setupTableView()
    {
         tempListTableView.delegate = self
         tempListTableView.dataSource = self
     }
    
    func setSubView()
         {
            let subViewFrame : CGRect = CGRect(x: 90,y: 150,width: 265,height: 170)
            let testView : AddCityView = AddCityView(frame: subViewFrame)
            testView.delegate = self
            testView.tag = 100
            self.tempListTableView.addSubview(testView)
         }
    
    func setTime(time : Double) -> String  {
        if let timeResult = (time as? Double) {
            let date = Date(timeIntervalSince1970: timeResult)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
           return localDate
        }
    }
    
    
}

//MARK: - Delegate and DataSource Methods
extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if  weatherData.count == 0
      {
        return 1
      }
    else
      {
        return weatherData.count+1
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == weatherData.count
        {
              tempListTableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
            let dataCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
                 dataCell.delegate = self
                 return dataCell
        }
              tempListTableView.register(UINib.init(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
            let dataCell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
        dataCell.setTempData(cityName: weatherData[indexPath.row].name, cityTemperature: "\(weatherData[indexPath.row].main.temp)")
               //  dataCell.delegate = self
                 return dataCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    //MARK: - Error
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == weatherData.count{
            self.setSubView()
        }
        else{
        let sampleStoryBoard : UIStoryboard = UIStoryboard(name: "TemperatureDetails", bundle:nil)
        let homeView  = sampleStoryBoard.instantiateViewController(withIdentifier: "Temp") as! TemperatureDetails
        let sunSetTime  = self.setTime(time: weatherData[indexPath.row].sys.sunset)
        let sunRiseTIme = self.setTime(time: weatherData[indexPath.row].sys.sunrise)
        homeView.weatherData.append(weatherData[indexPath.row])
            homeView.dictionaryData = [sunRiseTIme ,"\(Int(weatherData[indexPath.row].wind.speed*3.6)) Km/hr" ,"\(weatherData[indexPath.row].main.temp_min) °C",weatherData[indexPath.row].weather[0].description,"\(weatherData[indexPath.row].visibility/1000) Km"]
        homeView.dictionaryData2 = [ sunSetTime,weatherData[indexPath.row].wind.deg,"\(weatherData[indexPath.row].main.temp_max) °C","\(weatherData[indexPath.row].main.humidity) %","\(weatherData[indexPath.row].main.pressure)hPa"]
       self.present(homeView, animated: true, completion: nil)
        }
        
        }
        
        
  }


//MARK:- Protocol Functions
extension ViewController : AddCityViewdelegate
{
    func addCityName(city: String) {
        self.removeSubView()
        let TempManager : WeatherManager = WeatherManager()
        TempManager.delegate = self
       TempManager.structUrl(name: city)
    
    }
    
    func cancelView() {
        self.removeSubView()
    }
    
    
    func removeSubView()  {
        if let viewWithTag = self.view.viewWithTag(100) {
                               viewWithTag.removeFromSuperview()
                           }else{
                               print("No!")
                           }
    }
}


//MARK: - Weather Manager Protocols
extension ViewController : WeatherManagerDelegate
{
    func structData(data: weatherModel) {
        self.weatherData.append(data)
        DispatchQueue.main.async {
                   self.tempListTableView.reloadData()
               }
    }
}
