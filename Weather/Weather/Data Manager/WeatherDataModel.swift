//
//  WeatherDataModel.swift
//  Weather
//
//  Created by logesh on 11/8/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import Foundation


struct weatherModel : Codable {
    
    var coord : coord
    var weather : [weather]
    var main : Main
    var name : String
    var sys : Sys
    var visibility : Int
    var wind : Wind
    
}

struct coord : Codable {
      var lon : Float
      var lat : Float
}

struct weather : Codable {
    var id : Int
    var main : String
    var description : String
}

struct Main : Codable {
    var temp : Double
    var pressure : Int
    var humidity :  Int
    var temp_min : Double
    var temp_max : Double
}

struct Sys : Codable
{
    var type : Int
    var id : Int
    var country : String
    var sunrise : Double
    var sunset : Double
}

struct  Wind : Codable
{
    var speed : Float
    var deg : Int
}

