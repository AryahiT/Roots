//
//  MapView.swift
//  Roots
//
//  Created by student on 6/25/25.
//


import SwiftUI
import MapKit

struct TempleFeature: Identifiable {
  let id = UUID()
  let name: String
  let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 35.8, longitude: -78.6),
    span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.5)
  )
  @State private var annotations: [TempleFeature] = []
  
  var body: some View {
    VStack(spacing: 0) {
      Map(coordinateRegion: $region, annotationItems: annotations) { temple in
        MapAnnotation(coordinate: temple.coordinate) {
          VStack {
            Image(systemName: "temple") // SF Symbol
              .foregroundColor(.red)
            Text(temple.name)
              .font(.caption)
              .padding(4)
              .background(Color.white.opacity(0.7))
              .cornerRadius(5)
          }
        }
      }
      .onAppear(perform: loadGeoJSON)
      .edgesIgnoringSafeArea(.top)
      
      Divider().background(Color.gray.opacity(0.3)).padding(.bottom, 10)
      
      // Bottom Nav Bar
      HStack(spacing: 20) {
        NavigationLink(destination: HomeView()) { Image("Home").resizable().frame(width: 45, height: 45) }
        NavigationLink(destination: CalanderView()) { Image("Calander").resizable().frame(width: 45, height: 45) }
        NavigationLink(destination: GroupsView()) { Image("Groups").resizable().frame(width: 45, height: 45) }
        NavigationLink(destination: MapView()) { Image("MapIcon").resizable().frame(width: 45, height: 45) }
        NavigationLink(destination: FriendsRMView()) { Image("FriendRM").resizable().frame(width: 45, height: 45) }
        NavigationLink(destination: HamView()) { Image("Options").resizable().frame(width: 45, height: 45) }
      }
      .padding(.bottom, 10)
    }
    .background(Color("NewYellow").edgesIgnoringSafeArea(.all))
    .navigationBarBackButtonHidden(true)
  }
  
  func loadGeoJSON() {
    guard let url = Bundle.main.url(forResource: "NCTemples", withExtension: "geojson"),
          let data = try? Data(contentsOf: url),
          let features = try? MKGeoJSONDecoder()
            .decode(data)
            .compactMap({ $0 as? MKGeoJSONFeature }) else {
      return
    }
    
    annotations = features.compactMap { f in
      guard let coord = (f.geometry.first as? MKPointAnnotation)?
              .coordinate else { return nil }
      let name = f.properties
          .flatMap { try? JSONSerialization.jsonObject(with: $0) as? [String: Any] }
          .flatMap { $0["name"] as? String } ?? "Temple"
      return TempleFeature(name: name, coordinate: coord)
    }
  }
}
