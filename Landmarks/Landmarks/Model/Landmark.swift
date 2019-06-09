//
//  Landmark.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import CoreLocation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  private(set) var imageName: String
  fileprivate var coordinates: Coordinates
  var state: String
  var park: String
  var category: Category
  var isFavorite: Bool

  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude)
  }

  enum Category: String, CaseIterable, Codable, Hashable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
  }
}

struct Coordinates: Hashable, Codable {
  var latitude: Double
  var longitude: Double
}
