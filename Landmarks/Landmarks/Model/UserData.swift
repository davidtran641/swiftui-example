//
//  UserData.swift
//  Landmarks
//
//  Created by Tran Duc on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject {
  var showFavoriteOnly = false
  {
    didSet {
      didChange.send(self)
    }
  }
  var landmarks: [Landmark] = []
  {
    didSet {
      didChange.send(self)
    }
  }

  let didChange = PassthroughSubject<UserData, Never>()

  init(landmarks: [Landmark]) {
    self.landmarks = landmarks
  }
}


