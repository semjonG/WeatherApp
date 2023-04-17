//
//  CityNameView.swift
//  WeatherApp
//
//  Created by mac on 17.04.2023.
//

import SwiftUI

struct CityNameView: View {
  let city: String
  let date: String
  
  var body: some View {
    HStack {
      VStack(alignment: .center, spacing: 10) {
        Text(city)
          .font(.title)
          .bold()
        Text(date)
      }.foregroundColor(.white)
    }
  }
}

struct CityNameView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
