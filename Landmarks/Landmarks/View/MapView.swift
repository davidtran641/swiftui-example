//
//  MapView.swift
//  Landmarks
//
//  Created by David Tran on 6/9/19.
//  Copyright © 2019 DavidTran. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {

  var coordinate: CLLocationCoordinate2D

  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
  }

  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    uiView.setRegion(region, animated: true)
  }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(
      latitude: 1.3138397, longitude: 103.8159136))
  }
}
#endif

