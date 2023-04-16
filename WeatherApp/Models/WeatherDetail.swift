//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by mac on 13.04.2023.
//

import Foundation

/// Подробная информация в конце каждого блока с полями, поле "weather"
struct WeatherDetail: Codable {
  ///например "Clouds"
  let main: String
  ///например "overcast clouds", более подробное описание main
  let description: String
  ///номер иконки-лого - отображает состояние погоды. например "04d" (d - day, n - night)
  let icon: String
}
