//
//  LandmarkList.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
  @EnvironmentObject var userData: UserData

  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $userData.showFavoriteOnly) {
          Text("Favorites only")
        }
        
        ForEach(userData.landmarks) { landmark in
          if !self.userData.showFavoriteOnly || landmark.isFavorite {
            NavigationButton(destination: LandmarkDetail(landmark: landmark), isDetail: true) {
              LandmarkRow(landmark: landmark)
            }
          }
        }
      }
    }
    .navigationBarTitle(Text("Landmarks"), displayMode: .large)
  }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
  static let landmarkStore = LandmarkStore(autoLoadData: true)
  static var previews: some View {
    ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
      LandmarkList()
        .environmentObject(UserData(landmarks: landmarkStore.landmarkData))
        .previewDevice(PreviewDevice(rawValue: deviceName))
    }
  }
}
#endif

