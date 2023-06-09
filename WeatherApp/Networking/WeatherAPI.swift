//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by mac on 12.04.2023.
//

import Foundation

struct WeatherAPI {
    static let apiKey = "ef051bc0fd49e2d695fdc3e3983c646e"
}

extension WeatherAPI {
  static let baseURLString = "https://api.openweathermap.org/data/2.5/onecall?"

  static func getURLFor(lat: Double, lon: Double) -> String {
      return "\(baseURLString)lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(apiKey)&units=metric"
  }
}
