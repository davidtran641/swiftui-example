//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  var body: some View {
    HStack {
      ImageStore.shared.image(name: landmark.imageName, size: 50)
      Text(landmark.name)
      Spacer()

      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .imageScale(.medium)
          .foregroundColor(.yellow)
      }
    }
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static let landmarkStore = LandmarkStore(autoLoadData: true)

  static var previews: some View {
    Group {
      LandmarkRow(landmark: landmarkStore.landmarkData[0])
      LandmarkRow(landmark: landmarkStore.landmarkData[1])
    }.previewLayout(.fixed(width: 300, height: 70))
  }
}
