//
//  MainView.swift
//  WeatherApp
//
//  Created by mac on 27.04.2023.
//

import SwiftUI

struct MainView: View {
  @ObservedObject var cityVM = CityViewVM()

  var body: some View {
    ZStack(alignment: .bottom) {
      VStack(spacing: 0) {
        MenuHeaderView(cityVM: cityVM).padding()
        ScrollView(showsIndicators: false) {
          CityView(cityVM: cityVM)
        }
        .padding(.top, 10)
      }
      .padding(.top, 40)
    }
    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]),
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing)).edgesIgnoringSafeArea(.all)
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
