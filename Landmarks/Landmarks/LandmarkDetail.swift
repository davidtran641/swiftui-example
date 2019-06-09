//
//  ContentView.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
  var body: some View {
    VStack {
      MapView()
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)

      CircleImage()
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack {
        Text("Turtle Rock")
          .font(.title)
          .color(.green)
        HStack {
          Text("National Botanic Garden")
            .font(.subheadline)
          Spacer()
          Text("Singapore")
            .font(.subheadline)
        }
      }.padding()
      Spacer()
    }
  }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
  static var previews: some View {
    LandmarkDetail()
  }
}
#endif



