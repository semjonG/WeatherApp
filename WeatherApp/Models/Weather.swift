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
//  let sunrise: Int?
//  let sunset: Int?
  let temperature: Double
  let feelsLike: Double
  let pressure: Int
  let humidity: Int
  let dewPoint: Double
  let clouds: Int
  let windSpeed: Double
  let windDeg: Int
  let weather: [WeatherDetail]
  
  enum CodingKeys: String, CodingKey {
    case date = "dt"
//    case sunrise
//    case sunset
    case temperature = "temp"
    case feelsLike = "feels_like"
    case pressure
    case humidity
    case dewPoint = "dew_point"
    case clouds
    case windSpeed = "wind_speed"
    case windDeg = "wind_deg"
    case weather
  }
  
  // стартовые значения
  init() {
    date = 0
//    sunrise = 0
//    sunset = 0
    temperature = 0.0
    feelsLike = 0.0
    pressure = 0
    humidity = 0
    dewPoint = 0.0
    clouds = 0
    windSpeed = 0.0
    windDeg = 0
    weather = []
  }
}

#warning("почему вынесен id когда он должен лежать в WeatherDetail, если это он. возможно, это из-за протокола Identifiable. и вообще зачем он?")
extension Weather {
  var id: UUID {
    return UUID()
  }
}


/*
 // MARK: - Current
 struct Current: Codable {
     let current: CurrentClass
 }

 // MARK: - CurrentClass
 struct CurrentClass: Codable {
     let dt, sunrise, sunset: Int
     let temp, feelsLike: Double
     let pressure, humidity: Int
     let dewPoint, uvi: Double
     let clouds, visibility: Int
     let windSpeed: Double
     let windDeg: Int
     let windGust: Double
     let weather: [Weather]

     enum CodingKeys: String, CodingKey {
         case dt, sunrise, sunset, temp
         case feelsLike = "feels_like"
         case pressure, humidity
         case dewPoint = "dew_point"
         case uvi, clouds, visibility
         case windSpeed = "wind_speed"
         case windDeg = "wind_deg"
         case windGust = "wind_gust"
         case weather
     }
 }

 // MARK: - Weather
 struct Weather: Codable {
     let id: Int
     let main, description, icon: String
 }

 */

