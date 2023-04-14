//
//  WeatherAPI+Extensions.swift
//  WeatherApp
//
//  Created by mac on 12.04.2023.
//

import Foundation

extension WeatherAPI {
  static let baseURL = "https://api.openweathermap.org/data/3.0/"
  
  static func getURLFor(lat: Double, lon: Double) -> String {
    return "\(baseURL)oncall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(apiKey)&units=metric"
  }
}


//https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=minutely&appid=ef051bc0fd49e2d695fdc3e3983c646e&units=metric
