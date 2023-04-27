//
//  CityViewVM.swift
//  WeatherApp
//
//  Created by mac on 14.04.2023.
//

import SwiftUI
import CoreLocation

/// Класс предназначен для наблюдения за изменениями, когда они происходят (когда API возвращает ответ).
/// CoreLocation используется, чтобы доставать координаты из адреса.
final class CityViewVM: ObservableObject {
  
  @StateObject var locationManager = LocationManager()
  
  @Published var weather = WeatherResponse.empty()

  @Published var city = "San Francisco" {
    didSet {
      getLocation()
    }
  }
  
  // MARK: - Private properties
  
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    return formatter
  }()
  
  private lazy var dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.dateFormat = "EEE"
    return formatter
  }()
  
  private lazy var timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh a"
    return formatter
  }()
  
  init() {
    getLocation()
  }
  
  // MARK: - Properties
  
  var date: String {
    dateFormatter.locale = Locale(identifier: "en_US")
   return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)))
  }
  
  var weatherIcon: String {
    if weather.current.detailedWeather.count > 0 {
      return weather.current.detailedWeather[0].icon
    }
    return "dayClearSky"
  }
  
  var temperature: String {
    return getTemperatureFor(temperature: weather.current.temperature)
  }
  
  var windSpeed: String {
    return String(format: "%0.1f", weather.current.windSpeed)
  }
  
  var humidity: String {
    return String(format: "%d%", weather.current.humidity)
  }
  
  /// точка росы/возможность дождя
  var rainChances: String {
    return String(format: "%0.0f", weather.current.dewPoint)
  }
  
  /// общая характеристика погоды, например - облачно
  var conditions: String {
    if weather.current.detailedWeather.count > 0 {
      return weather.current.detailedWeather[0].main
    }
    return ""
  }
  
  ///широта по текущей геопозиции пользователя
  var currentUsersLatitude: Double {
    return locationManager.lastLocation?.coordinate.latitude ?? 0.0
  }

  ///долгота по текущей геопозиции пользователя
  var currentUsersLongitude: Double {
    return locationManager.lastLocation?.coordinate.longitude ?? 0.0
  }
  
  // MARK: - Private methods
  
  /// Функция, вызывающая getWeather(), в который подставляются координаты.
  /// Может распознать введенное название города в поисковую строку и конвертировать в координаты.
  private func getLocation() {
    CLGeocoder().geocodeAddressString(city) { placemarks, error in
      if let places = placemarks,
         let place = places.first {
        self.getWeather(coordinates: place.location?.coordinate)
      }
    }
  }
  
  /// Функция, которая подставляет широту и долготу в URL и делает запрос с готовым урлом и городом.
  private func getWeather(coordinates: CLLocationCoordinate2D?) {
    if let coordinates = coordinates {
      let urlString = WeatherAPI.getURLFor(lat: coordinates.latitude, lon: coordinates.longitude)
      getWeatherInternal(city: city, for: urlString)
    } else {
//      let urlString = WeatherAPI.getURLFor(lat: 37.5485, lon: -121.9886)
      let urlString = WeatherAPI.getURLFor(lat: currentUsersLatitude, lon: currentUsersLongitude)
      getWeatherInternal(city: city, for: urlString)
    }
  }
  
  /// Функция, в которой @Published проперти вяжется с пришедшими данными с сервера.
  private func getWeatherInternal(city: String, for urlString: String) {
    NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { result in
      switch result {
      case .success(let response):
        DispatchQueue.main.async {
          self.weather = response
        }
      case .failure(let error):
        print(error)
      }
    }
  }
  
  // MARK: - Methods
  func getTemperatureFor(temperature: Double) -> String {
    String(format: "%0.1f", temperature)
  }
  
  func getHourFor(timestamp: Int) -> String {
    return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
  }
  
  func getDayFor(timestamp: Int) -> String {
    return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
  }
  
  /// Функция, которая вяжет номер анимации с сервера и Lottie анимацию.
  func getLottieAnimationFor(icon: String) -> String {
    switch icon {
    case "01d": return "dayClearSky"
    case "01n": return "nightClearSky"
    case "02d": return "dayFewClouds"
    case "02n": return "nightFewClouds"
    case "03d": return "dayScatteredClouds"
    case "03n": return "nightScatteredClouds"
    case "04d": return "dayBrokenClouds"
    case "04n": return "nightBrokenClouds"
    case "09d": return "dayShowerRains"
    case "09n": return "nightShowerRains"
    case "10d": return "dayRain"
    case "10n": return "nightRain"
    case "11d": return "dayThunderstorm"
    case "11n": return "nightThunderstorm"
    case "13d": return "daySnow"
    case "13n": return "nightSnow"
    case "50d": return "dayMist"
    case "50n": return "nightMist"
    default: return "dayClearSky"
    }
  }
  
  /// Функция, которая возвращает SF symbol в соответствии с номером логотипа с сервера (для неанимированных вьюшек).
  func getWeatherIconFor(icon: String) -> Image {
    switch icon {
    case "01d": return Image(systemName: "sun.max.fill") //"clear_sky_day"
    case "01n": return Image(systemName: "moon.fill") //"clear_sky_night"
    case "02d": return Image(systemName: "cloud.sun.fill") //"few_clouds_day"
    case "02n": return Image(systemName: "cloud.moon.fill") //"few_clouds_night"
    case "03d": return Image(systemName: "cloud.fill") //"scattered_clouds"
    case "03n": return Image(systemName: "cloud.fill") //"scattered_clouds"
    case "04d": return Image(systemName: "cloud.fill") //"broken_clouds"
    case "04n": return Image(systemName: "cloud.fill") //"broken_clouds"
    case "09d": return Image(systemName: "cloud.drizzle.fill") //"shower_rain"
    case "09n": return Image(systemName: "cloud.drizzle.fill") //"shower_rain"
    case "10d": return Image(systemName: "cloud.heavyrain.fill")//"rain_day"
    case "10n": return Image(systemName: "cloud.heavyrain.fill") //"rain_night"
    case "11d": return Image(systemName: "cloud.bolt.fill") //"thunderstorm_day"
    case "11n": return Image(systemName: "cloud.bolt.fill") //"thunderstorm_night"
    case "13d": return Image(systemName: "cloud.snow.fill") //"snow"
    case "13n": return Image(systemName: "cloud.snow.fill") //"snow"
    case "50d": return Image(systemName: "cloud.fog.fill") //"mist"
    case "50n": return Image(systemName: "cloud.fog.fill") //"mist"
    default: return Image(systemName: "sun.max.fill")
    }
  }
}
