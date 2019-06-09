//
//  LandmarkStore.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import Foundation

class LandmarkStore {
  private(set) var landmarkData: [Landmark] = []

  init(autoLoadData: Bool = false) {
    if (autoLoadData) {
      loadData()
    }
  }

  func loadData() {
    landmarkData = load("landmarkData.json")
  }

  private func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
      else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
  }
}
