//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by mac on 17.04.2023.
//

import SwiftUI

struct HourlyWeatherView: View {
  @ObservedObject var cityVM: CityViewVM
  
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          // доступ к погоде по часам
          ForEach(cityVM.weather.hourly) { weather in
            let icon = cityVM.getWeatherIconFor(icon: weather.detailedWeather.count > 0 ? weather.detailedWeather[0].icon : "sun.max.fill")
            let hour = cityVM.getHourFor(timestamp: weather.date)
            let temperature = cityVM.getTemperatureFor(temperature: weather.temperature)
            getHourlyView(hour: hour, image: icon, temperature: temperature)
          }
        }
      }
    }
  
  private func getHourlyView(hour: String, image: Image, temperature: String) -> some View {
    VStack(spacing: 20) {
      Text(hour)
      image.foregroundColor(.yellow)
      Text(temperature)
    }
    .foregroundColor(.white)
    .padding()
    .background(RoundedRectangle(cornerRadius: 5)
      .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5411764706, green: 0.7607843137, blue: 0.9764705882, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]),
                           startPoint: .top,
                           endPoint: .bottom))
        .opacity(0.3))
    .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
  }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
