//
//  LottieView.swift
//  WeatherApp
//
//  Created by mac on 17.04.2023.
//

import SwiftUI
import Lottie

/// Lottie не написана на SwiftUI, поэтому нужно использовать протокол UIViewRepresentable
struct LottieView: UIViewRepresentable {
  let name: String
  let loopMode: LottieLoopMode = .loop
  
  func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
    let view = UIView()
    return view
  }
  
  /// "слушает" изменения view
  func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
    // resetting state
    uiView.subviews.forEach({ $0.removeFromSuperview() })
    
    let lottieAnimationView = LottieAnimationView()
    lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
    uiView.addSubview(lottieAnimationView)
    
    lottieAnimationView.animation = LottieAnimation.named(name)
    lottieAnimationView.contentMode = .scaleAspectFit
    lottieAnimationView.loopMode = loopMode
    lottieAnimationView.play()
    
    NSLayoutConstraint.activate([
      lottieAnimationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
      lottieAnimationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
    ])
  }
}
