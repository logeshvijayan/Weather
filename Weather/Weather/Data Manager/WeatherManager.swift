//
//  WeatherManager.swift
//  Weather
//
//  Created by logesh on 11/9/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol WeatherManagerDelegate
{
    func structData(data : weatherModel)
}

//MARK: - Class
class WeatherManager: NSObject {
    
    //MARK: - Variables
    var apiHeader : String = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    var apiKey : String = "a1a1fd2177b24243931cfccaeb732ab5"
    var temperature : Double = 0
    var delegate : WeatherManagerDelegate?
   
    //MARK: - Life Cycle
    override init() {
        super.init()
    }
    
    //MARk:- API Functions
    func structUrl(name : String) {
        
        let apiUrl = URL(string : "\(apiHeader)&appid=\(apiKey)&q=\(name)")!
        print(apiUrl)
        self.performUrlSession(url : apiUrl)
    }
    
    
    func performUrlSession(url : URL)  {
        let session = URLSession(configuration : .default)
        let task = session.dataTask(with: url, completionHandler: {(data,response,error) in
            
           if error != nil
                   {
                       return
                   }
                   if let jsonData = data
                   {
                     self.parseJSonData(data: jsonData)
                    
                   }
        })
        task.resume()
    }
    
    func parseJSonData(data : Data)   {
        let decoder = JSONDecoder()
        do
        {
          
            let decodedData = try decoder.decode(weatherModel.self, from: data)
            self.delegate?.structData(data: decodedData)
        }
        catch{
            print(error)
        }
        
    }
    
    
    
}
