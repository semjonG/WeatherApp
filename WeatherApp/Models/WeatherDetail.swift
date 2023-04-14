//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by mac on 13.04.2023.
//

import Foundation

/// Подробная информация в конце каждого блока с полями, поле "weather"
struct WeatherDetail: Codable {
  let main: String
  let description: String
  let icon: String
}
