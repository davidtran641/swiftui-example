//
//  LandmarkList.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
  var landmarks: [Landmark]
  var body: some View {
    NavigationView {
      List(landmarks) { landmark in
        NavigationButton(destination: LandmarkDetail(landmark: landmark), isDetail: true) {
          LandmarkRow(landmark: landmark)
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
      LandmarkList(landmarks: landmarkStore.landmarkData)
        .previewDevice(PreviewDevice(rawValue: deviceName))
    }
  }
}
#endif

