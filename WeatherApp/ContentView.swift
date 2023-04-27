//
//  ContentView.swift
//  WeatherApp
//
//  Created by mac on 12.04.2023.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    ZStack {
      TabView {
        MainView()
          .tabItem {
            Image(systemName: "location")
            Text("Main")
          }
          .tag(0)
        
        ForecastView()
          .tabItem {
            Image(systemName: "calendar")
            Text("Forecast")
          }
          .tag(1)
      }
      
      VStack {
        Spacer()
        CustomButtonView()
          .frame(width: 70, height: 70)
          .background(Color.blue)
          .cornerRadius(35)
          .shadow(color: Color.white.opacity(0.1), radius: 5, x: -5, y: -5)
          .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
          .offset(y: 0)
      }
      .ignoresSafeArea(.keyboard)
    }
  }
}

struct CustomButtonView: View {
  var body: some View {
    
    Button(action: {}, label: {
      Image(systemName: "plus")
        .resizable()
        .scaledToFit()
        .foregroundColor(.white)
        .padding(20)
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
