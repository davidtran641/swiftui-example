//
//  CircleImage.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
  var body: some View {
    Image("turtlerock")
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 10)
  }
}

struct CircleImage_Preview: PreviewProvider {
  static var previews: some View {
    CircleImage()
  }
}
