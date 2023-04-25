//
//  WeatherRespose.swift
//  WeatherApp
//
//  Created by mac on 13.04.2023.
//

import Foundation

///// Первоначальный блок с полями, который приходит с сервера.
struct WeatherResponse: Codable {
  let current: Weather
  let hourly: [Weather] // приходит несколько блоков на каждый час
  let daily: [DailyWeather]

  /// для hourly берем 23 часа
  /// для daily берем 8 дней, для того чтобы была плавная подмена последнего значения
  static func empty() -> WeatherResponse {
    return WeatherResponse(current: Weather(),
                           hourly: [Weather](repeating: Weather(), count: 23),
                           daily: [DailyWeather](repeating: DailyWeather(), count: 8))
  }
}
