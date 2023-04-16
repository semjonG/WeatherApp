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
