//
//  MenuHeaderView.swift
//  WeatherApp
//
//  Created by mac on 17.04.2023.
//

import SwiftUI

struct MenuHeaderView: View {

  ///проперти, в которое будет приходить вью-модель с данными о погоде
  @ObservedObject var cityVM: CityViewVM

  @State private var searchCity = "San Francisco"
  
  var body: some View {
    HStack {
      TextField("", text: $searchCity)
        .padding(.leading, 20)
      
      Button {
        cityVM.city = searchCity
      } label: {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
          
          Image(systemName: "location.fill")
        }
      }
      .frame(width: 50, height: 50)
    }
    .foregroundColor(.white)
    .padding()
    .background(ZStack (alignment: .leading) {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.white)
        .padding(.leading, 10)
      
      RoundedRectangle(cornerRadius: 10)
        .fill(Color.blue.opacity(0.5))
    })
  }
}

struct MenuHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
