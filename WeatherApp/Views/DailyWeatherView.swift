//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by mac on 17.04.2023.
//

import SwiftUI

struct DailyWeatherView: View {
  @ObservedObject var cityVM = CityViewVM()

    var body: some View {
      // доступ к погоде по дням
      ForEach(cityVM.weather.daily) { weather in
        LazyVStack {
          dailyCell(weather: weather)
        }
      }
    }
  
  private func dailyCell(weather: DailyWeather) -> some View {
    HStack {
      Text(cityVM.getDayFor(timestamp: weather.date).uppercased()).frame(width: 50)
      Spacer()
      Text("\(cityVM.getTemperatureFor(temperature: weather.temperature.max)) | \(cityVM.getTemperatureFor(temperature: weather.temperature.min)) ℃").frame(width: 150)
      Spacer()
      cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
    }
    .foregroundColor(.white)
    .padding(.horizontal, 40)
    .padding(.vertical, 15)
//    #warning("нужно будет сделать вью модифайер или расширение, чтобы не копировать этот код")
    .background(RoundedRectangle(cornerRadius: 8)
      .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5411764706, green: 0.7607843137, blue: 0.9764705882, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]),
                           startPoint: .top,
                           endPoint: .bottom))
        .opacity(0.3))
    .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
  }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
