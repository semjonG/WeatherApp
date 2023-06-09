//
//  Weather.swift
//  WeatherApp
//
//  Created by mac on 13.04.2023.
//

import Foundation

// need Identifiable cuz of SwiftUI  needs idintify each record individualy
/// Этот блок с полями универсальный: приходит и для поля current, и для hourly
struct Weather: Codable, Identifiable {
  let date: Int
  let temperature: Double
  let feelsLike: Double
  let pressure: Int
  let humidity: Int
  let dewPoint: Double
  let clouds: Int
  let windSpeed: Double
  let windDeg: Int
  /// Подробная информация в конце каждого блока с полями, поле "weather"
  let detailedWeather: [WeatherDetail]
  
  enum CodingKeys: String, CodingKey {
    case date = "dt"
    case temperature = "temp"
    case feelsLike = "feels_like"
    case pressure
    case humidity
    case dewPoint = "dew_point"
    case clouds
    case windSpeed = "wind_speed"
    case windDeg = "wind_deg"
    case detailedWeather = "weather"
  }
  
  // стартовые значения
  init() {
    date = 0
    temperature = 0.0
    feelsLike = 0.0
    pressure = 0
    humidity = 0
    dewPoint = 0.0
    clouds = 0
    windSpeed = 0.0
    windDeg = 0
    detailedWeather = []
  }
}

extension Weather {
  var id: UUID {
    UUID()
  }
}
