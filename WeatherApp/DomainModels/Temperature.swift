//
//  Temperature.swift
//  WeatherApp
//
//  Created by mac on 14.04.2023.
//

import Foundation

/// Блок "temp" внутри блока "daily"
struct Temperature: Codable {
  let min: Double
  let max: Double
}
