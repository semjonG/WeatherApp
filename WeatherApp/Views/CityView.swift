//
//  CityView.swift
//  WeatherApp
//
//  Created by mac on 17.04.2023.
//

import SwiftUI

struct CityView: View {
  @ObservedObject var cityVM: CityViewVM
  
    var body: some View {
      VStack {
        CityNameView(city: cityVM.city, date: cityVM.date)
          .shadow(radius: 0)
        TodayWeatherView(cityVM: cityVM)
          .padding()
        HourlyWeatherView(cityVM: cityVM)
        DailyWeatherView(cityVM: cityVM)
      }.padding(.bottom, 30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
