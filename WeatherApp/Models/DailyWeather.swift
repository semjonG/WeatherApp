//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by mac on 13.04.2023.
//

import Foundation

/// Это блок поля "daily", который лежит внутри WheatherResponse - первоначального блока 
struct DailyWeather: Codable, Identifiable {
  let date: Int
  let temperature: Temperature
  let weather: [WeatherDetail]
  
  enum CodingKeys: String, CodingKey {
    case date = "dt"
    case temperature = "temp"
    case weather
  }
  
  init() {
    date = 0
    temperature = Temperature(min: 0.0, max: 0.0)
    weather = [WeatherDetail(main: "", description: "", icon: "")]
  }
}

extension DailyWeather {
  var id: UUID {
    return UUID()
  }
}
