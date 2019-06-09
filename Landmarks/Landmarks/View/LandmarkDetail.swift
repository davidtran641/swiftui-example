//
//  ContentView.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
  @EnvironmentObject var userData: UserData
  var landmark: Landmark

  var landmarkIndex: Int {
    userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  var body: some View {
    VStack {
      MapView(coordinate: landmark.locationCoordinate)
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300.0)

      CircleImage(image: ImageStore.shared.image(name: landmark.imageName, size: 250))
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
            .color(.green)
          Button(action: {
            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
          }, label: {
            if self.userData.landmarks[self.landmarkIndex].isFavorite {
              Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            } else {
              Image(systemName: "star")
                .foregroundColor(.gray)
            }
          })
        }
        HStack {
          Text(landmark.park)
            .font(.subheadline)

          Spacer()
          Text(landmark.state)
            .font(.subheadline)
        }
      }.padding()
      Spacer()
    }
    .navigationBarTitle(Text(landmark.name), displayMode: .inline)
  }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
  static let landmarkStore = LandmarkStore()
  static var previews: some View {
    LandmarkDetail(landmark: landmarkStore.landmarkData[0])
      .environmentObject(UserData(landmarks: landmarkStore.landmarkData))
  }
}
#endif



